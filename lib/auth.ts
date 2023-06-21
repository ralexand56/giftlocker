
import SpotifyProvider from "next-auth/providers/spotify";
import spotifyApi, { LOGIN_URL } from "./spotify";

async function refreshAccessToken(token: any) {
    try {
      spotifyApi.setAccessToken(token.accessToken);
      spotifyApi.setRefreshToken(token.refreshToken);
  
      const { body: refreshedToken } = await spotifyApi.refreshAccessToken();
  
      return {
        ...token,
        accessToken: refreshedToken.access_token,
        accessTokenExpires: Date.now() + refreshedToken.expires_in * 1000,
        refreshToken: refreshedToken.refresh_token ?? token.refreshToken,
      };
    } catch (error) {
      console.error(error);
  
      return {
        ...token,
        error: "RefreshAccessTokenError",
      };
    }
  }
  
  export const authOptions = {
    providers: [
      SpotifyProvider({
        clientId: process.env.SPOTIFY_CLIENT_ID || "",
        clientSecret: process.env.SPOTIFY_CLIENT_SECRET || "",
        authorization: LOGIN_URL,
      }),
    ],
    secret: process.env.JWT_SECRET,
    pages: {
      signIn: "/login",
      error: "/login",
    },
    callbacks: {
      async jwt({ token, account, user }: any) {
        if (account && user) {
          return {
            ...token,
            accessToken: account.accessToken,
            refreshToken: account.refreshToken,
            accessTokenExpires: account.expires_at * 1000,
          };
        }
  
        if (Date.now() < token.accessTokenExpires) {
          return token;
        }
  
        console.log("refreshing token");
        return await refreshAccessToken(token);
      },
      async session({ session, token }: any) {
        session.user.accessToken = token.accessToken;
        session.user.refreshToken = token.refreshToken;
        session.user.username = token.username;
  
        return session;
      },
    },
  };