"use client";

import { AnimatePresence, motion } from "framer-motion";
import { useState } from "react";

interface Props {
  params: { id: string };
}

const list = {
  visible: {
    opacity: 1,
    transition: {
      type: "spring",
      duration: 0.7,
      staggerChildren: 0.5,
    },
  },
  hidden: { opacity: 0 },
};

const item = {
  visible: {
    opacity: 1,
    y: 0,
  },
  hidden: { opacity: 0, y: 20 },
};

const captions = ["Wolf Blitzer", "Anchor", "CNN", "Washington, D.C."];
export default function Page({ params: { id } }: Props) {
  const [on, setOn] = useState(false);

  return (
    <div className="flex items-start justify-start gap-5">
      <motion.ul className="relative mt-3 flex overflow-hidden divide-x-2 border-orange-500 border-l-4 text-orange-700">
        {captions.map((caption, i) => (
          <div key={i} className={`overflow-hidden bg-slate-100 p-2 ${i===0 ?"font-bold": ""}`}>
            <motion.li
              className=""
              initial={{ x: 200 }}
              animate={{ x: 0 }}
              transition={{ duration: 0.3, delay: i * 0.1 }}
            >
              {caption}
            </motion.li>
          </div>
        ))}
      </motion.ul>
    </div>
  );
}
