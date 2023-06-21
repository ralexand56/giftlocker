"use client";

import { motion } from "framer-motion";
import PlayerCard from "./PlayerCard";

const players = [
  { name: "Michael Wilson", score: 99.6 },
  { name: "Parker Washington", score: 59.6 },
  { name: "R.J. Sneed", score: 98.3 },
  { name: "Jonathon Mingo", score: 59.6 },
  { name: "Adonicas Sanders", score: 97.2 },
];

const container = {
  hidden: { opacity: 1 },
  show: {
    opacity: 1,
    transition: {
      staggerChildren: 3,
    },
  },
};

export default function PlayerList() {
  return (
    <motion.ul
      variants={container}
      initial="hidden"
      animate="show"
      className="flex flex-col gap-6"
    >
      {players.map(({ name, score }, index) => (
        <PlayerCard
          key={index}
          name={name}
          score={score}
          index={index.toString()}
        />
      ))}
    </motion.ul>
  );
}
