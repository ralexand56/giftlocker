import { getServerSession } from "next-auth";

// import { SessionProvider, useSession } from "next-auth/react";
export const metadata = {
  title: "Gift Locker Login",
  description: "The ultimate source for finding the perfect gift",
};

export default async function RootLayout({
  children,
  ...props
}: {
  children: React.ReactNode;
  props: any;
}) {
  console.log("props", await getServerSession());
  return <div>{children}</div>;
}
