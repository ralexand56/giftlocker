"use client";

import { DialogHTMLAttributes, useRef, useState } from "react";

export default function Counter() {
  const [count, setCount] = useState(0);
  const dialog = useRef() as React.MutableRefObject<HTMLDialogElement>;

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>Click me</button>
      <button
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
        onClick={() => dialog?.current?.showModal()}
      >
        Show
      </button>
      <dialog className="bg-transparent w-full h-full" ref={dialog}>
        <div className="grid 
                        w-64 
                        content-center
                        divide-y-2 
                        divide-amber-300
                        rounded-lg
                        shadow-2xl
                        bg-amber-800">
          {new Array(5).fill(null).map((_, ind) => (
            <p key={ind} className="text-xl text-amber-300 p-6 italic font-bold">
              Dialog {ind + 1}
            </p>
          ))}
        </div>
      </dialog>
    </div>
  );
}
