import "./globals.css";
import { Inter } from "next/font/google";
import { NextAuthProvider } from "./providers";
import SideNavigation from "@/components/SideNavigation";

const inter = Inter({ subsets: ["latin"] });

export const metadata = {
  title: "Gift Locker",
  description: "The ultimate source for finding the perfect gift",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <div className="grid grid-cols-[auto_1fr] gap-4 h-screen overflow-hidden">
          <SideNavigation />
          {children}
        </div>
      </body>
    </html>
  );
}
