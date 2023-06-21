import { HomeModernIcon } from "@heroicons/react/24/outline";

async function fetchSpotifyToken() {
  const res = await fetch(`https://accounts.spotify.com/api/token`, {
    headers: {
      Authorization: `Basic ${process.env.SPOTIFY_CLIENT_ID}:${process.env.SPOTIFY_CLIENT_SECRET}`,
      "Content-Type": "application/x-www-form-urlencoded",
    },
    method: "POST",
    body: JSON.stringify({
      grant_type: "authorization_code",
    }),
  });
  return await res.json();
}

async function fetchWebApi(endpoint: string, method: string, body: any) {
  const res = await fetch(`https://api.spotify.com/${endpoint}`, {
    headers: {
      Authorization: `Bearer ${fetchSpotifyToken()}`,
    },
    method,
    body: JSON.stringify(body),
  });
  return await res.json();
}

export default async function SpotifyPage() {
  console.log(await fetchSpotifyToken());

  return (
    <main className="p-5 text-purple-500">
      <h3 className="flex space-x-2">
        <HomeModernIcon className="h-5 w-5" />
        <span>Spotify</span>
      </h3>
    </main>
  );
}
