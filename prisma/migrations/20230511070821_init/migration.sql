BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[__EFMigrationsHistory] (
    [MigrationId] NVARCHAR(150) NOT NULL,
    [ProductVersion] NVARCHAR(32) NOT NULL,
    CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED ([MigrationId])
);

-- CreateTable
CREATE TABLE [dbo].[AssessmentExternalUser] (
    [AssessmentsId] UNIQUEIDENTIFIER NOT NULL,
    [ExternalAssessorsId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_AssessmentExternalUser] PRIMARY KEY CLUSTERED ([AssessmentsId],[ExternalAssessorsId])
);

-- CreateTable
CREATE TABLE [dbo].[Assessments] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Status] NVARCHAR(max) NOT NULL,
    [AssessmentType] NVARCHAR(max) NOT NULL,
    [AssessmentApproach] NVARCHAR(max),
    [ControlAssessorStatus] NVARCHAR(max),
    [StartDate] DATETIMEOFFSET NOT NULL,
    [EndDate] DATETIMEOFFSET,
    [CreatedOn] DATETIMEOFFSET NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIMEOFFSET NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    [TenantID] UNIQUEIDENTIFIER NOT NULL,
    [Name] NVARCHAR(max) NOT NULL CONSTRAINT [DF__Assessment__Name__4CC05EF3] DEFAULT 'N''',
    [UserId] UNIQUEIDENTIFIER,
    CONSTRAINT [PK_Assessments] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[BillingAddresses] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [AddressLine1] NVARCHAR(max),
    [AddressLine2] NVARCHAR(max),
    [City] NVARCHAR(max),
    [State] NVARCHAR(max),
    [Zip] NVARCHAR(max),
    [Country] NVARCHAR(max),
    [CreatedOn] DATETIME2 NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIME2 NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    CONSTRAINT [PK_BillingAddresses] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[BillingAdminDetails] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [FirstName] NVARCHAR(max),
    [LastName] NVARCHAR(max),
    [BillingEmail] NVARCHAR(max),
    [Phone] NVARCHAR(max),
    [CreatedOn] DATETIME2 NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIME2 NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    CONSTRAINT [PK_BillingAdminDetails] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[BillingDetails] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [PaymentMethod] NVARCHAR(max),
    [PaymentMethod2] NVARCHAR(max),
    [CardNumber] NVARCHAR(max),
    [ExpirationDate] NVARCHAR(max),
    [Name] NVARCHAR(max),
    [SecurityCode] NVARCHAR(max),
    [AddressLine1] NVARCHAR(max),
    [AddressLine2] NVARCHAR(max),
    [City] NVARCHAR(max),
    [State] NVARCHAR(max),
    [Zip] NVARCHAR(max),
    [Country] NVARCHAR(max),
    [BillingPlan] INT NOT NULL,
    [CreatedOn] DATETIME2 NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIME2 NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    CONSTRAINT [PK_BillingDetails] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[ControlAssessors] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [AssessmentId] UNIQUEIDENTIFIER NOT NULL,
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [Tier] NVARCHAR(max),
    [CreatedOn] DATETIMEOFFSET NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIMEOFFSET NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    CONSTRAINT [PK_ControlAssessors] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[DashboardCard] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [TenantID] UNIQUEIDENTIFIER NOT NULL,
    [DashboardName] INT NOT NULL,
    [QueryID] UNIQUEIDENTIFIER NOT NULL,
    [Height] INT NOT NULL,
    [Width] INT NOT NULL,
    [X] INT NOT NULL,
    [Y] INT NOT NULL,
    [AggregationField] INT NOT NULL CONSTRAINT [DF__Dashboard__Aggre__4BCC3ABA] DEFAULT 0,
    [AggregationItems] NVARCHAR(max),
    [SortBy] NVARCHAR(max),
    [SortOrder] INT NOT NULL CONSTRAINT [DF__Dashboard__SortO__4AD81681] DEFAULT 0,
    [MajorConcernColor] NVARCHAR(max),
    [MinorConcernColor] NVARCHAR(max),
    [SatisfactoryColor] NVARCHAR(max),
    [Title] NVARCHAR(max),
    [WidgetType] INT NOT NULL,
    [CreatedOn] DATETIME2 NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIME2 NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    [GroupBy] NVARCHAR(max),
    [IsDefault] BIT NOT NULL CONSTRAINT [DF__Dashboard__IsDef__47FBA9D6] DEFAULT CONVERT([bit],(0)),
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_DashboardCard] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[DashboardQuery] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [TenantID] UNIQUEIDENTIFIER NOT NULL,
    [Name] NVARCHAR(max),
    [Query] NVARCHAR(max),
    [CreatedOn] DATETIME2 NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIME2 NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    CONSTRAINT [PK_DashboardQuery] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[Domains] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [DomainName] NVARCHAR(max),
    [WillManageOwnRecords] BIT NOT NULL,
    [TxtName] NVARCHAR(max),
    [TxtValue] NVARCHAR(max),
    [IsVerified] BIT NOT NULL,
    [IsDefault] BIT NOT NULL,
    [TenantID] UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn] DATETIME2 NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIME2 NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    CONSTRAINT [PK_Domains] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[ExternalUsers] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Email] NVARCHAR(max),
    [Name] NVARCHAR(max) NOT NULL,
    [Type] NVARCHAR(max),
    [Certifications] NVARCHAR(max),
    [Approach] NVARCHAR(max),
    [AssessmentType] NVARCHAR(max),
    [Review] NVARCHAR(max),
    [CreatedOn] DATETIMEOFFSET NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIMEOFFSET NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    CONSTRAINT [PK_ExternalUsers] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[Systems] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Name] NVARCHAR(max),
    [State] NVARCHAR(max),
    [Country] NVARCHAR(max),
    [LocationType] NVARCHAR(max),
    [TenantID] UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn] DATETIME2 NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIME2 NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    CONSTRAINT [PK_Systems] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[Tenant] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [OrganizationType] NVARCHAR(max) NOT NULL,
    [BusinessPhoneNumber] NVARCHAR(max),
    [CompanyName] NVARCHAR(max),
    [Country] NVARCHAR(max),
    [ContactPermission] BIT NOT NULL,
    [PhoneNumber] NVARCHAR(max),
    [BillingAddressID] UNIQUEIDENTIFIER,
    [BillingAdminDetailID] UNIQUEIDENTIFIER,
    [BillingDetailID] UNIQUEIDENTIFIER,
    [SecondaryPhoneNumber] NVARCHAR(max),
    [SecondaryCountryCode] NVARCHAR(max),
    [CreatedOn] DATETIME2 NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIME2 NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[Users] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Email] NVARCHAR(max) NOT NULL,
    [FirstName] NVARCHAR(max) NOT NULL,
    [LastName] NVARCHAR(max) NOT NULL,
    [IsActive] BIT NOT NULL,
    [TenantID] UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn] DATETIME2 NOT NULL,
    [CreatedBy] NVARCHAR(max),
    [UpdatedOn] DATETIME2 NOT NULL,
    [UpdatedBy] NVARCHAR(max),
    [IsDeleted] BIT NOT NULL,
    [City] NVARCHAR(max),
    [CountryOrRegion] NVARCHAR(max),
    [Department] NVARCHAR(max),
    [DisplayName] NVARCHAR(max),
    [FaxNumber] NVARCHAR(max),
    [JobTitle] NVARCHAR(max),
    [MobilePhone] NVARCHAR(max),
    [Office] NVARCHAR(max),
    [OfficePhone] NVARCHAR(max),
    [StateOrProvince] NVARCHAR(max),
    [StreetAddress] NVARCHAR(max),
    [ZipOrPostal] NVARCHAR(max),
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_AssessmentExternalUser_ExternalAssessorsId] ON [dbo].[AssessmentExternalUser]([ExternalAssessorsId]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_Assessments_TenantID] ON [dbo].[Assessments]([TenantID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_Assessments_UserId] ON [dbo].[Assessments]([UserId]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_ControlAssessors_AssessmentId] ON [dbo].[ControlAssessors]([AssessmentId]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_ControlAssessors_UserId] ON [dbo].[ControlAssessors]([UserId]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_DashboardCard_QueryID] ON [dbo].[DashboardCard]([QueryID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_DashboardCard_TenantID] ON [dbo].[DashboardCard]([TenantID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_DashboardCard_UserId] ON [dbo].[DashboardCard]([UserId]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_DashboardQuery_TenantID] ON [dbo].[DashboardQuery]([TenantID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_Domains_TenantID] ON [dbo].[Domains]([TenantID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_Systems_TenantID] ON [dbo].[Systems]([TenantID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_Tenant_BillingAddressID] ON [dbo].[Tenant]([BillingAddressID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_Tenant_BillingAdminDetailID] ON [dbo].[Tenant]([BillingAdminDetailID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_Tenant_BillingDetailID] ON [dbo].[Tenant]([BillingDetailID]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [IX_Users_TenantID] ON [dbo].[Users]([TenantID]);

-- AddForeignKey
ALTER TABLE [dbo].[AssessmentExternalUser] ADD CONSTRAINT [FK_AssessmentExternalUser_Assessments_AssessmentsId] FOREIGN KEY ([AssessmentsId]) REFERENCES [dbo].[Assessments]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[AssessmentExternalUser] ADD CONSTRAINT [FK_AssessmentExternalUser_ExternalUsers_ExternalAssessorsId] FOREIGN KEY ([ExternalAssessorsId]) REFERENCES [dbo].[ExternalUsers]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Assessments] ADD CONSTRAINT [FK_Assessments_Tenant_TenantID] FOREIGN KEY ([TenantID]) REFERENCES [dbo].[Tenant]([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Assessments] ADD CONSTRAINT [FK_Assessments_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ControlAssessors] ADD CONSTRAINT [FK_ControlAssessors_Assessments_AssessmentId] FOREIGN KEY ([AssessmentId]) REFERENCES [dbo].[Assessments]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ControlAssessors] ADD CONSTRAINT [FK_ControlAssessors_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[DashboardCard] ADD CONSTRAINT [FK_DashboardCard_DashboardQuery_QueryID] FOREIGN KEY ([QueryID]) REFERENCES [dbo].[DashboardQuery]([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[DashboardCard] ADD CONSTRAINT [FK_DashboardCard_Tenant_TenantID] FOREIGN KEY ([TenantID]) REFERENCES [dbo].[Tenant]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[DashboardCard] ADD CONSTRAINT [FK_DashboardCard_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[DashboardQuery] ADD CONSTRAINT [FK_DashboardQuery_Tenant_TenantID] FOREIGN KEY ([TenantID]) REFERENCES [dbo].[Tenant]([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Domains] ADD CONSTRAINT [FK_Domains_Tenant_TenantID] FOREIGN KEY ([TenantID]) REFERENCES [dbo].[Tenant]([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Systems] ADD CONSTRAINT [FK_Systems_Tenant_TenantID] FOREIGN KEY ([TenantID]) REFERENCES [dbo].[Tenant]([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Tenant] ADD CONSTRAINT [FK_Tenant_BillingAddresses_BillingAddressID] FOREIGN KEY ([BillingAddressID]) REFERENCES [dbo].[BillingAddresses]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Tenant] ADD CONSTRAINT [FK_Tenant_BillingAdminDetails_BillingAdminDetailID] FOREIGN KEY ([BillingAdminDetailID]) REFERENCES [dbo].[BillingAdminDetails]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Tenant] ADD CONSTRAINT [FK_Tenant_BillingDetails_BillingDetailID] FOREIGN KEY ([BillingDetailID]) REFERENCES [dbo].[BillingDetails]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [FK_Users_Tenant_TenantID] FOREIGN KEY ([TenantID]) REFERENCES [dbo].[Tenant]([Id]) ON DELETE CASCADE ON UPDATE NO ACTION;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
