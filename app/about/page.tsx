"use client";

import { motion } from "framer-motion";

interface Props {}

export default function About({}: React.PropsWithChildren<Props>) {
  return (
    <motion.div
      initial={{ opacity: 0, y: -100 }}
      animate={{ opacity: 1, y: 0 }}
      className="p-4"
    >
      About that! And me
    </motion.div>
  );
}
