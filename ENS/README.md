# ENS

> **Note :** Setup First lets get an ENS name for your address,start by opening up `https://app.ens.domains/`.

## Website

To develop the website we will use **React** and **Next Js**. React is a javascript framework used to make websites and Next.js is a React framework that also allows writing backend APIs code along with the frontend, so you don't need two separate frontend and backend services. First, You will need to create a new **next** app. Your folder structure should look something like

### Start
 `- ENS
    - my-app`
To create this **next-app**, in the terminal point to ENS folder and type
`npx create-next-app@latest`
Now to run the app, execute these commands in the terminal
`cd my-app
npm run dev`
Now go to **http://localhost:3000**, your app should be running 🤘

Let's install the **Web3Modal library**. Web3Modal is an easy to use library to help developers easily allow their users to connect to your dApps with all sorts of different wallets. By default Web3Modal Library supports injected providers like (Metamask, Dapper, Gnosis Safe, Frame, Web3 Browsers, etc) and WalletConnect, You can also easily configure the library to support Portis, Fortmatic, Squarelink, Torus, Authereum, D'CENT Wallet and Arkane. Open up a terminal pointing at **my-app** directory and execute this command
`npm install web3modal`
In the same terminal also install **ethers.js**
`npm install ethers`
