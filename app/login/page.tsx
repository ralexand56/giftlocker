"use client";

import {
  ClientSafeProvider,
  LiteralUnion,
  SessionProvider,
  getProviders,
  signIn,
  useSession,
} from "next-auth/react";
import { getServerSession } from "next-auth/next";
import { useEffect, useState } from "react";
import { BuiltInProviderType } from "next-auth/providers";

export default function Login() {
  const [providers, setProviders] = useState<Record<
    LiteralUnion<BuiltInProviderType, string>,
    ClientSafeProvider
  > | null>();

  useEffect(() => {
    (async () => {
      const res = await getProviders();
      console.log("res", res);
      setProviders(res);
    })();
  }, []);
// const session = useSession();
  console.log("providers", providers);
//   console.log("session", session);
  if (!providers) {
    return null;
  }

  return (
    <div className="space-x-2 p-5">
      <span>Login:</span>
      {Object.values(providers).map((provider) => (
        <button
          key={provider.id}
          className="rounded bg-blue-500 px-4 py-2 font-bold text-white hover:bg-blue-700"
          onClick={() => signIn(provider.id)}
        >
          {provider.name}
        </button>
      ))}
    </div>
  );
}
