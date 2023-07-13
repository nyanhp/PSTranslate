# PSTranslate

A little module to get translations from cloud service like the Azure Cognitive Services.

*Note: You will need to register for your own API keys.*

While limits are configurable, PSTranslate does not keep track of what you do
across sessions. The limits are enforced per call only. That means:

If you pipe 1.000 strings with 5 characters each to Get-Translation, and the
hourly limit is 2.000.000 characters/hour (Azure Free Tier), it translates
to 550 characters/second. Your cmdlet will run approximately 10 seconds so
as not to run into limits. Certain APIs, like Azure for example, enforce
the hourly limit on a much shorter sliding window (per minute).

## Currently implemented providers

- Azure Cognitive Services
