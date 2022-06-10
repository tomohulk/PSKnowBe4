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
    [String]$Extention
    [String]$MoblePhoneNumber
    [String]$Location
    [String]$Division
    [String]$ManagerName
    [String]$ManagerEmail
    [Bool]$ProvisioningManaged
    [String]$ProvisioningGuid
    [KnowBe4ReportingGroup[]]$Group
    [Double]$CurrentRiskScore
    [String[]]$Alias
    [DateTime]$JoinedOn
    [Nullable[DateTime]]$LastSignIn
    [KnowBe4ReportingStatus]$Status
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
        $this.Extention            = $object.extention
        $this.MoblePhoneNumber     = $object.mobile_phone_number
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
        $this.Organization         = $object.organisation
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
    [Float]$CurrentRiskScore
    [KnowBe4ReportingStatus]$Status

    KnowBe4ReportingGroup([Object]$object) {
        $this.Id               = $object.id
        $this.Name             = $object.name
        $this.GroupType        = $object.group_type
        $this.ProvisioningGuid = $object.provisioning_guid
        $this.MemberCount      = $object.member_count
        $this.CurrentRiskScore = $object.current_risk_score
        $this.Status           = $object.status
    }
}
