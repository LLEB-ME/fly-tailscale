# fly-tailscale
Quickly generate a consumer VPN using Fly and Tailscale

0. Sign up for and install [Fly](https://fly.io). 
1. Clone this repository (`git clone git@github.com:LLEB-ME/fly-tailscale.git`) and create an application with whatever name you want (`flyctl launch`).
2. [Create a reusable, ephemeral, pre-approved auth key with Tailscale.](https://login.tailscale.com/admin/settings/keys) and add it to your application (`flyctl secrets set TAILSCALE_AUTH="tskey-<key>" --app <app>`)
3. Deploy to Fly (`flyctl deploy`)

Scaling is as easy as adding the new region (`flyctl regions add <region>`) and scale up (`flyctl scale count <number-of-regions>`).
