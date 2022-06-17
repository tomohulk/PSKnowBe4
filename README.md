# PSKnowBe4
PowerShell Module Wrapper for the KnowBe4 APIs

---

There are two APIs for the KnowBe4 Product, Reporting and User Events.

The Reporting API Docs can be found [here](https://developer.knowbe4.com/rest/reporting).
The User Event API Docs can be found [here](https://developer.knowbe4.com/rest/userEvents).

It made sense to me to keep this two separate PowerShell wrappers as well. PSKnowBe4Reporting and PSKnowBe4UserEvent.

---

### PSKnowBe4.Reporting

Cmdlets:
![PSKnowBe4ReportingAPIKey](/Docs/Images/PSKnowBe4ReportingAPIKey.png?raw=true)

Each of the cmdlets support an `-APIKey` parameter which can be passed with each call.  However to simplify use, you can either set the DefaultParameterValue:

```PowerShell
(Get-Command -Module PSKnowBe4Reporting -ParameterName APIKey.ForEach({$Global:PSDefaultParameterValues.Add("$($_.Name):APIKey", '<YourAPIKey')
```

or, you can simply set the `$env:PSKnowBe4ReportingAPIKey` environment variable.  That is the default value for the `-APIKey` parameter.

```PowerShell
$env:PSKnowBe4ReportingAPIKey = '<YourAPIKey>'
```

there is some rate limiting enforced by KnowBe4, so be aware of that.  The specs can be found in the docs.

---

TODO:
* Training Functions for the Reporting API.
* The Entire User Events API ;).
