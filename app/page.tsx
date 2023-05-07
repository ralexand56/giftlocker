import { AcademicCapIcon } from "@heroicons/react/24/outline";
import Counter from "./Counter";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between border-2 p-24">
      <div className="z-10 w-full max-w-5xl items-center gap-4 justify-center border-2 text-sm lg:flex p-6">
        <AcademicCapIcon className="h-10 w-10 text-teal-500" />
        <Counter />
      </div>
    </main>
  );
}
