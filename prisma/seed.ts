import { Assessments, PrismaClient, Tenant, Users } from "@prisma/client";
import { randomUUID } from "crypto";

const prisma = new PrismaClient();

const newTenantId = randomUUID();

const newTenant: Tenant = {
  Id: newTenantId,
  IsDeleted: false,
  OrganizationType: "Company",
  ContactPermission: true,
  CreatedOn: new Date("2021-01-01"),
  CreatedBy: "John Doe",
  UpdatedOn: new Date("2021-01-01"),
  UpdatedBy: "John Doe",
};

const newUserId = randomUUID();

const newUser: Users = {
  Id: newUserId,
  IsActive: true,
  FirstName: "John",
  LastName: "Doe",
  Email: "ralexand56@live.com",
  CreatedOn: new Date("2021-01-01"),
  CreatedBy: "John Doe",
  UpdatedOn: new Date("2021-01-01"),
  UpdatedBy: "John Doe",
  IsDeleted: false,
  TenantID: newTenantId,
};

const assessments: Assessments[] = [
  {
    Id: randomUUID(),
    Status: "Completed",
    Name: "ASMT240913399",
    ControlAssessorStatus: "Completed",
    AssessmentType: "Maturity assessment",
    AssessmentApproach: "Internal",
    StartDate: new Date("2021-01-01"),
    EndDate: new Date("2021-01-01"),
    CreatedBy: "John Doe",
    CreatedOn: new Date("2021-01-01"),
    UpdatedOn: new Date("2021-01-01"),
    UpdatedBy: "John Doe",
    IsDeleted: false,
    UserId: newUserId,
    TenantID: newTenantId,
  },
];

async function createTenant() {
  await prisma.tenant.create({
    data: newTenant,
  });
  await prisma.users.create({ data: newUser });

  main()
    .catch((e) => {
      console.error(e);
      process.exit(1);
    })
    .finally(() => {
      prisma.$disconnect();
    });
}

createTenant();

async function main() {
  for (let assessment of assessments) {
    await prisma.assessments.create({ data: assessment });
  }
}
