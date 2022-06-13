Enum KnowBe4ReportingStatus {
    Active
    Archived
}

Class KnowBe4ReportingUser {
    [Int]$Id
    [String]$EmployeeNumber
    [String]$FirstName
    [String]$LastName
    [String]$JobTitle
    [String]$Email
    [Float]$PhishPronePercentage
    [String]$PhoneNumber
    [String]$Extension
    [String]$MobilePhoneNumber
    [String]$Location
    [String]$Division
    [String]$ManagerName
    [String]$ManagerEmail
    [Bool]$ProvisioningManaged
    [String]$ProvisioningGuid
    [KnowBe4ReportingGroup[]]$Group
    [Double]$CurrentRiskScore
    [String[]]$Alias
    [Nullable[DateTime]]$JoinedOn
    [Nullable[DateTime]]$LastSignIn
    [Nullable[KnowBe4ReportingStatus]]$Status
    [String]$Organization
    [String]$Department
    [String]$Language
    [String]$Comment
    [Nullable[DateTime]]$EmployeeStartDate
    [Nullable[DateTime]]$ArchivedAt
    [String]$CustomField1
    [String]$CustomField2
    [String]$CustomField3
    [String]$CustomField4
    [Nullable[DateTime]]$CustomDate1
    [Nullable[DateTime]]$CustomDate2

    KnowBe4ReportingUser([Object]$object) {
        $this.Id                   = $object.id
        $this.EmployeeNumber       = $object.employee_number
        $this.FirstName            = $object.first_name
        $this.LastName             = $object.last_name
        $this.JobTitle             = $object.job_title
        $this.Email                = $object.email
        $this.PhishPronePercentage = $object.phish_prone_percentage
        $this.PhoneNumber          = $object.phone_number
        $this.Extension            = $object.extension
        $this.MobilePhoneNumber    = $object.mobile_phone_number
        $this.Location             = $object.location
        $this.Division             = $object.division
        $this.ManagerName          = $object.manager_name
        $this.ManagerEmail         = $object.manager_email
        $this.ProvisioningManaged  = $object.provisioning_managed
        $this.ProvisioningGuid     = $object.provisioning_guid
        $this.Group                = $object.groups
        $this.CurrentRiskScore     = $object.current_risk_score
        $this.Alias                = $object.aliases
        $this.JoinedOn             = $object.joined_on
        $this.LastSignIn           = $object.last_sign_in
        $this.Status               = $object.status
        $this.Organization         = $object.organization
        $this.Department           = $object.department
        $this.Language             = $object.language
        $this.Comment              = $object.comment
        $this.EmployeeStartDate    = $object.start_date
        $this.ArchivedAt           = $object.archived_at
        $this.CustomField1         = $object.custom_field_1
        $this.CustomField2         = $object.custom_field_2
        $this.CustomField3         = $object.custom_field_3
        $this.CustomField4         = $object.custom_field_4
        $this.CustomDate1          = $object.custom_date_1
        $this.CustomDate2          = $object.custom_date_2 
    }
}

Class KnowBe4ReportingGroup {
    [Int]$Id
    [String]$Name
    [String]$GroupType
    [String]$ProvisioningGuid
    [Int]$MemberCount
    [Double]$CurrentRiskScore
    [Nullable[KnowBe4ReportingStatus]]$Status

    KnowBe4ReportingGroup([Object]$object) {
        $this.Id               = if ($null -ne $object.group_id) { $object.group_id } elseif ($null -ne $object.id) { $object.id } else { $object }
        $this.Name             = $object.name
        $this.GroupType        = $object.group_type
        $this.ProvisioningGuid = $object.provisioning_guid
        $this.MemberCount      = $object.member_count
        $this.CurrentRiskScore = $object.current_risk_score
        $this.Status           = $object.status
    }
}

Class KnowBe4ReportingSubscription {
    [String]$Name
    [String]$Type
    [String[]]$Domain
    [KnowBe4ReportingAdministrator[]]$Administrators
    [String]$SubscriptionLevel
    [Nullable[DateTime]]$SubscriptionEndDate
    [Int]$NumberOfSeats
    [Double]$CurrentRiskScore

    KnowBe4ReportingSubscription([Object]$object) {
        $this.Name                = $object.name
        $this.Type                = $object.type
        $this.Domain              = $object.domains
        $this.Administrators      = $object.admins
        $this.SubscriptionLevel   = $object.subscription_level
        $this.SubscriptionEndDate = $object.subscription_end_date
        $this.NumberOfSeats       = $object.number_of_seats
        $this.CurrentRiskScore    = $object.current_risk_score
    }
}

Class KnowBe4ReportingAdministrator {
    [Int]$Id
    [String]$FirstName
    [String]$LastName
    [String]$Email

    KnowBe4ReportingAdministrator([Object]$object) {
        $this.Id = $object.id
        $this.FirstName = $object.first_name
        $this.LastName = $object.last_name
        $this.Email = $object.email
    }
}

Class KnowBe4ReportingPhishingCampaign {
    [Int]$Id
    [String]$Name
    [KnowBe4ReportingGroup[]]$Group
    [Float]$LastPhishPronePercentage
    [Nullable[DateTime]]$LastRun
    [String]$Status
    [Bool]$Hidden
    [String]$SendDuration
    [String]$TrackDuration
    [String]$Frequency
    [Int[]]$DifficultyFilter
    [Nullable[DateTime]]$CreationDate
    [Int]$PhishingSecurityTestCount
    [KnowBe4ReportingPhishingSecurityTest[]]$PhishingSecurityTest

    KnowBe4ReportingPhishingCampaign([Object]$object) {
        $this.Id                        = $object.campaign_id
        $this.Name                      = $object.name
        $this.Group                     = $object.groups
        $this.LastPhishPronePercentage  = $object.last_phish_prone_percentage
        $this.LastRun                   = $object.last_run
        $this.Status                    = $object.status
        $this.Hidden                    = $object.hidden
        $this.SendDuration              = $object.send_duration
        $this.TrackDuration             = $object.track_duration
        $this.Frequency                 = $object.frequency
        $this.DifficultyFilter          = $object.difficulty_filter
        $this.CreationDate              = $object.create_date
        $this.PhishingSecurityTestCount = $object.psts_count
        $this.PhishingSecurityTest      = $object.psts
    }
}

Class KnowBe4ReportingPhishingSecurityTest {
    [Int]$CampaignId
    [Int]$Id
    [String]$Status
    [String]$Name
    [KnowBe4ReportingGroup[]]$Group
    [Float]$PhishPronePercentage
    [Nullable[DateTime]]$StartedAt
    [Int]$Duration
    [KnowBe4ReportingPhishingSecurityTestCategory[]]$Category
    [KnowBe4ReportingPhishingSecurityTestTemplate]$Template
    [KnowBe4ReportingPhishingSecurityTestLandingPage]$LandingPage
    [Int]$ScheduledCount
    [Int]$DeliveredCount
    [Int]$OpenedCount
    [Int]$ClickedCount
    [Int]$RepliedCount
    [Int]$AttachmentOpenedCount
    [Int]$MacroEnabledCount
    [Int]$DataEnteredCount
    [Int]$QRCodeScannedCount
    [Int]$ReportedCount
    [Int]$BouncedCount

    KnowBe4ReportingPhishingSecurityTest ([Object]$object) {
        $this.CampaignId            = $object.campaign_id
        $this.Id                    = $object.pst_id
        $this.Status                = $object.status
        $this.Name                  = $object.name
        $this.Group                 = $object.groups
        $this.PhishPronePercentage  = $object.phish_prone_percentage
        $this.StartedAt             = $object.started_at
        $this.Duration              = $object.duration
        $this.Category              = $object.category
        $this.Template              = $object.template
        $this.LandingPage           = $object.landing_page
        $this.ScheduledCount        = $object.scheduled_count
        $this.DeliveredCount        = $object.delivered_count
        $this.OpenedCount           = $object.opened_count
        $this.ClickedCount          = $object.clicked_count
        $this.RepliedCount          = $object.replied_count
        $this.AttachmentOpenedCount = $object.attachment_opened_count
        $this.MacroEnabledCount     = $object.macro_enabled_count
        $this.DataEnteredCount      = $object.data_entered_count
        $this.QRCodeScannedCount    = $object.qr_code_scanned_count
        $this.ReportedCount         = $object.reported_count
        $this.BouncedCount          = $object.bounced_count
    }
}

Class KnowBe4ReportingPhishingSecurityTestCategory {
    [Int]$Id
    [String]$Name

    KnowBe4ReportingPhishingSecurityTestCategory([Object]$object) {
        $this.Id   = $object.category_id
        $this.Name = $object.name
    }
}

Class KnowBe4ReportingPhishingSecurityTestTemplate {
    [Int]$Id
    [String]$Name
    [Int]$Difficultly
    [String]$Type

    KnowBe4ReportingPhishingSecurityTestTemplate([Object]$object) {
        $this.Id          = $object.id
        $this.Name        = $object.name
        $this.Difficultly = $object.difficulty
        $this.Type        = $object.type
    }
}

Class KnowBe4ReportingPhishingSecurityTestLandingPage {
    [Int]$Id
    [String]$Name

    KnowBe4ReportingPhishingSecurityTestLandingPage([Object]$object) {
        $this.Id   = $object.id
        $this.Name = $object.name
    }
}

Class KnowBe4ReportingRecipientResult {
    [Int]$Id
    [Int]$PishingSecurityTestId
    [KnowBe4ReportingUser]$User
    [KnowBe4ReportingPhishingSecurityTestTemplate]$Template
    [Nullable[DateTime]]$ScheduledAt
    [Nullable[DateTime]]$DeliveredAt
    [Nullable[DateTime]]$OpenedAt
    [Nullable[DateTime]]$ClickedAt
    [Nullable[DateTime]]$RepliedAt
    [Nullable[DateTime]]$AttachmentOpenedAt
    [Nullable[DateTime]]$MacroEnabledAt
    [Nullable[DateTime]]$DataEnteredAt
    [Nullable[DateTime]]$QRCodeScannedAt
    [Nullable[DateTime]]$ReportedAt
    [Nullable[DateTime]]$BouncedAt
    [String]$IPAddress
    [String]$IPLocation
    [String]$BrowserName
    [String]$BrowserVersion
    [String]$OperatingSystem

    KnowBe4ReportingRecipientResult ([Object]$Object) {
        $this.Id                    = $object.id
        $this.PishingSecurityTestId = $object.pst_id
        $this.User                  = $object.user
        $this.Template              = $object.template
        $this.ScheduledAt           = $object.scheduled_at
        $this.DeliveredAt           = $object.delivered_at
        $this.OpenedAt              = $object.opened_at
        $this.ClickedAt             = $object.clicked_at
        $this.RepliedAt             = $object.replied_at
        $this.AttachmentOpenedAt    = $object.attachment_opened_at
        $this.MacroEnabledAt        = $object.macro_enabled_at
        $this.DataEnteredAt         = $object.data_entered_at
        $this.QRCodeScannedAt       = $object.qr_code_scanned
        $this.ReportedAt            = $object.reported_at
        $this.BouncedAt             = $object.bounced_at
        $this.IPAddress             = $object.ip
        $this.IPLocation            = $object.ip_location
        $this.BrowserName           = $object.browser
        $this.BrowserVersion        = $object.browser_version
        $this.OperatingSystem       = $object.os 
    }
}
