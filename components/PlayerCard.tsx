"use client";

import { AnimatePresence, motion } from "framer-motion";
import Link from "next/link";

interface Props {
  name: string;
  score: number;
  index: string;
}

const card = {
  hidden: { opacity: 0 },
  show: {
    opacity: 1,
    transition: {
      delayChildren: 0.5,
    },
  },
};

export default function PlayerCard({
  name,
  index,
  score,
}: React.PropsWithChildren<Props>) {
  return (
      <Link key={index} href={`players/${index}`}>
        <motion.li
          layoutId={index}
          variants={card}
          initial="hidden"
          animate="show"
          className={`
            hover:last:!opacity-50 
            font-600 
            relative 
            flex 
            w-80 
            items-center 
            justify-start
            rounded-xl 
            border 
            border-orange-600 
            bg-slate-700 
            text-2xl 
            text-white 
            transition-opacity 
            duration-100 
            ease-in-out `}
        >
          <span className="rounded-bl-xl rounded-tl-xl bg-orange-600 px-4 py-2">
            {index + 1}
          </span>
          <span className="w-60 border-orange-600 pl-1 font-normal text-white">
            {name}
          </span>
          <span className="absolute -right-12 h-20 w-20 rounded-full border-4 bg-slate-600"></span>
          <motion.span
            variants={card}
            initial="hidden"
            animate="show"
            className="bold absolute right-10 -mr-24 p-6 opacity-10 font-extrabold"
          >
            {score}
          </motion.span>
        </motion.li>
      </Link>
  );
}
