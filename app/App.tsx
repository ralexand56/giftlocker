import { getCurrentUser } from "@/lib/session";
import { notFound } from "next/navigation";
import PlayerList from "@/components/PlayerList";


async function getStores() {
  const response = await fetch(
    "https://0fesfmuv69.execute-api.us-west-2.amazonaws.com/Prod/api/CustomerCommService/GetStoreLocale?storeId=10004&deviceName=us"
  );
  const stores = await response.json();

  return stores;
}

export default async function App() {

  const user = await getCurrentUser();
  // console.log("user", user);

  if (!user) {
    return notFound();
  }

  return (
    <main className="flex flex-col overflow-auto">
      <div className="flex justify-end p-3">
        <img className="h-10 w-10 rounded" alt="profile" src={user.image} />
      </div>
      <PlayerList />
    </main>
  );
}
