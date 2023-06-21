"use client";

import jsonConverter from "json-to-ts";
import { useEffect, useState } from "react";

// const json = {
//   cats: [{ name: "Kittin" }, { name: "Mittin" }],
//   favoriteNumber: 42,
//   favoriteWord: "Hello",
// };

// async function getJson(url: string) {
//   const response = await fetch(url);
//   const json = await response.json();
//   console.log("json", json);

//   return json;
// }

export default function JsonInterfaceConverter() {
  const [url, setUrl] = useState<string>("");
  const [interfaceArray, setInterfaceArray] = useState<string[]>([]);

  const handleClick = async () => {
    const response = await fetch(url);
    const json = await response.json();

    setInterfaceArray(jsonConverter(json));
  };

  return (
    <main className="flex h-full w-4/5 m-auto flex-col gap-3 border-purple-500 p-5">
      <h1>JSON</h1>
      <div className="flex gap-3 justify-between">
        <input
          type="text"
          className="rounded px-1 w-full text-gray-500"
          placeholder="enter url to load json from..."
          onChange={(e) => setUrl(e.target.value)}
        />
        <button className="w-40 bg-slate-400 rounded" onClick={handleClick}>Get My Shit!</button>
      </div>
      <textarea
        value={interfaceArray.join("\n\n")}
        className="rounded p-2 bg-slate-300 h-screen text-purple-800"
      />
    </main>
  );
}
