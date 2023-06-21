"use client";

import { AnimatePresence, motion } from "framer-motion";
import Link from "next/link";
import { usePathname } from "next/navigation";

const links = [
  { title: "Home", href: "/" },
  { title: "About", href: "/about" },
  { title: "Players", href: "/players/0" },
];

interface Props {}

export default function SideNavigation({}: React.PropsWithChildren<Props>) {
  const pathName = usePathname();

  return (
    <nav className="flex w-40 flex-col bg-gradient-to-b from-orange-600 to-transparent">
      {links.map(({ title, href }) => {
        const isCurrentPath =
          pathName === href ||
          (pathName?.includes("players") && href.includes("players"));
        return (
          <Link key={title} href={href}>
            <div className="relative">
              <AnimatePresence>
                {isCurrentPath ? (
                  <motion.span
                    layoutId="pathSelect"
                    initial={{ opacity: 0.3 }}
                    className="absolute backdrop-sepia left-2 top-2 z-0 h-9 w-36 rounded-3xl bg-white opacity-20"
                  />
                ) : null}
              </AnimatePresence>

              <article className="z-10 text-center py-4 transition-all ease-in-out">
                {title}
              </article>
            </div>
          </Link>
        );
      })}
    </nav>
  );
}
