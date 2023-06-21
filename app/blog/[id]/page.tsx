import Link from "next/link";

interface Props {
  params: { id: string };
}

export default async function Blog({ params: { id } }: Props) {
  const st = {
    storeLocaleDetails: [
      {
        storeId: "10004",
        storeName: "Soho",
        storeTimeZone: "US/Eastern",
        store_preferred_locale: "en-US",
      },
    ],
  };
  // const store: typeof st = await getStores(id);
  return (
    <>
      <nav>
        <Link href={"/"}>Home</Link>
      </nav>
      <h2 className="p-20 text-blue-400">
        {/* Blog {store.storeLocaleDetails[0].storeName} */}
      </h2>
    </>
  );
}
