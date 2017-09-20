using System;
using System.Threading.Tasks;

public static string Run(string myQueueItem, TraceWriter log)
{
    log.Info($"C# ServiceBus queue trigger function processed message: {myQueueItem}");
    return "{\"leadid\":\"111\"}";
}
