using System;
using System.Threading.Tasks;
using Amazon.SQS;
using Amazon.SQS.Model;

var queueUrl = Environment.GetEnvironmentVariable("AWS_SQS_QUEUE_URL");
var regionName = Environment.GetEnvironmentVariable("AWS_REGION") ?? "us-east-1";

if (string.IsNullOrWhiteSpace(queueUrl))
{
    Console.WriteLine("AWS_SQS_QUEUE_URL is not set. Exiting.");
    return;
}

var region = Amazon.RegionEndpoint.GetBySystemName(regionName);
var sqs = new AmazonSQSClient(region);

Console.WriteLine($"ONYX Telemetry Worker started in region {regionName}...");
Console.WriteLine($"Listening on queue: {queueUrl}");

while (true)
{
    try
    {
        var response = await sqs.ReceiveMessageAsync(new ReceiveMessageRequest
        {
            QueueUrl = queueUrl,
            MaxNumberOfMessages = 5,
            WaitTimeSeconds = 10
        });

        if (response.Messages.Count == 0)
        {
            continue;
        }

        foreach (var msg in response.Messages)
        {
            Console.WriteLine($"[{DateTime.UtcNow:o}] Received message: {msg.Body}");

            await sqs.DeleteMessageAsync(queueUrl, msg.ReceiptHandle);
            Console.WriteLine($"Deleted message: {msg.MessageId}");
        }
    }
    catch (Exception ex)
    {
        Console.WriteLine($"[{DateTime.UtcNow:o}] Error: {ex}");
        await Task.Delay(TimeSpan.FromSeconds(5));
    }
}
