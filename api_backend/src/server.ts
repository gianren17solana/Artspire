import express, { Request, Response } from 'express';
import Stripe from 'stripe';
import { ArtItemWithArtist } from './models/ArtItem';

const item: ArtItemWithArtist[] = [  
  {
    id: 1,
    title: "Full Illustration Commission",
    description: "A fully detailed character illustration tailored to your style preferences.",
    details: "Includes high-resolution PNG, PSD layers, and optional minor revisions.",
    price: 3600,
    monetization_rate: 1.5,
    commercial_rate: 2,
    image_url: "https://cdn.donmai.us/original/05/b6/05b6f0fe636667a8962b0aaebd6e89a9.png",
    category: "Illustration",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.9,
    ratingCount: 245,
    created_at: new Date(),
    artist: {
      id: 1,
      username: "Arona",
      pfp_url: "https://cdn.donmai.us/original/dc/fe/dcfe825ea857757a414aec1910c7f0b1.jpg",
      bio: "Passionate about vibrant character art and magical aesthetics.",
      custom_tos: "Personal use only; commercial use requires extra license."
    },
  },
  {
    id: 2,
    title: "Stream Cover Artwork",
    description: "Eye-catching stream cover perfect for Twitch or YouTube branding.",
    details: "Delivered as high-resolution PNG with optional edits for layout adjustments.",
    price: 1550,
    monetization_rate: 1.75,
    commercial_rate: 2.3,
    image_url: "https://cdn.donmai.us/original/ec/26/ec2652f05ba6669dedff19d714c74c4d.jpg",
    category: "Illustration",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.7,
    ratingCount: 189,
    created_at: new Date(),
    artist: {
      id: 2,
      username: "Plana",
      pfp_url: "https://cdn.donmai.us/original/f3/4e/f34e3c5a7b8d9e0a1b2c3d4e5f6a7b8c.jpg",
      bio: "Specializes in dynamic, vibrant art that pops on streams.",
      custom_tos: "Personal use; commercial requires additional licensing."
    },
  },
  {
    id: 3,
    title: "Character Animation Loop",
    description: "Smooth looping animation for your character, perfect for VTuber or stream alerts.",
    details: "Delivered as MP4 and GIF formats. Includes 2-3 second loop with transparency option.",
    price: 4500,
    monetization_rate: 1.8,
    commercial_rate: 2.5,
    image_url: "https://cdn.donmai.us/original/a1/b2/a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6.gif",
    category: "Animation",
    status: "Open",
    is_new_offer: false,
    avgRating: 4.8,
    ratingCount: 156,
    created_at: new Date(),
    artist: {
      id: 3,
      username: "MotionMiku",
      pfp_url: "https://cdn.donmai.us/original/12/34/1234567890abcdef1234567890abcdef.jpg",
      bio: "Animation specialist with 5+ years experience in character motion.",
      custom_tos: "All animations are for personal use. Commercial licensing available."
    },
  },
  {
    id: 4,
    title: "Twitch Emote Pack (5 Emotes)",
    description: "Custom emote pack with 5 unique expressions for your channel.",
    details: "Delivered in all Twitch sizes (28x28, 56x56, 112x112). Includes source files.",
    price: 2000,
    monetization_rate: 1.3,
    commercial_rate: 1.8,
    image_url: "https://cdn.donmai.us/original/7a/88/7a88f2e636667a8962b0aaebd6e89a9c.png",
    category: "Emotes",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.6,
    ratingCount: 312,
    created_at: new Date(),
    artist: {
      id: 4,
      username: "EmoteQueen",
      pfp_url: "https://cdn.donmai.us/original/ab/cd/abcd1234efgh5678ijkl9012mnop3456.jpg",
      bio: "Creating cute and expressive emotes for streamers worldwide!",
      custom_tos: "Emotes are for personal streaming use only."
    },
  },
  {
    id: 5,
    title: "Animated Emote Set",
    description: "3 animated emotes with smooth transitions and effects.",
    details: "GIF format optimized for Twitch/Discord. 2-3 frames per emote.",
    price: 3500,
    monetization_rate: 1.6,
    commercial_rate: 2.2,
    image_url: "https://cdn.donmai.us/original/c5/c2/c5c2d2e636667a8962b0aaebd6e89a9d.gif",
    category: "Emotes",
    status: "Open",
    is_new_offer: false,
    avgRating: 4.5,
    ratingCount: 98,
    created_at: new Date(),
    artist: {
      id: 5,
      username: "PixelPanda",
      pfp_url: "https://cdn.donmai.us/original/de/fg/defg7890hijk1234lmno5678pqrs9012.jpg",
      bio: "Pixel art and animation enthusiast. Making your chat more lively!",
      custom_tos: "For streaming platforms only. No resale permitted."
    },
  },
  {
    id: 6,
    title: "VTuber Model Illustration",
    description: "High-quality reference sheet for VTuber model creation.",
    details: "Front, side, and back views. Includes expression sheet with 6 expressions.",
    price: 8500,
    monetization_rate: 2.0,
    commercial_rate: 3.0,
    image_url: "https://cdn.donmai.us/original/38/38/3838434546474849505152535455565758.png",
    category: "Illustration",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.95,
    ratingCount: 67,
    created_at: new Date(),
    artist: {
      id: 6,
      username: "VTuberArtist",
      pfp_url: "https://cdn.donmai.us/original/tu/vw/tuvw3456xyza7890bcde1234fghi5678.jpg",
      bio: "Specialized in VTuber character design and Live2D-ready illustrations.",
      custom_tos: "Full rights transfer available for additional fee."
    },
  },
  {
    id: 7,
    title: "Intro Animation",
    description: "Custom animated intro for your stream or YouTube channel.",
    details: "5-10 second animation with your logo/character. Includes sound design.",
    price: 6000,
    monetization_rate: 1.9,
    commercial_rate: 2.8,
    image_url: "https://cdn.donmai.us/original/21/21/21212e636667a8962b0aaebd6e89a9e.gif",
    category: "Animation",
    status: "Open",
    is_new_offer: false,
    avgRating: 4.4,
    ratingCount: 78,
    created_at: new Date(),
    artist: {
      id: 7,
      username: "AnimateStudio",
      pfp_url: "https://cdn.donmai.us/original/jk/lm/jklm9012nopq3456rstu7890vwxy1234.jpg",
      bio: "Professional animation studio creating stunning motion graphics.",
      custom_tos: "Commercial use included. Resale prohibited."
    },
  },
  {
    id: 8,
    title: "Chibi Character Art",
    description: "Adorable chibi-style character illustration.",
    details: "Full color with simple background. Perfect for profile pictures!",
    price: 800,
    monetization_rate: 1.4,
    commercial_rate: 1.9,
    image_url: "https://cdn.donmai.us/original/f6/36/f636667a8962b0aaebd6e89a905b6c7.png",
    category: "Illustration",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.3,
    ratingCount: 421,
    created_at: new Date(),
    artist: {
      id: 8,
      username: "ChibiMaster",
      pfp_url: "https://cdn.donmai.us/original/za/bc/zabc5678defg9012hijk3456lmno7890.jpg",
      bio: "Making everyone adorable, one chibi at a time!",
      custom_tos: "Personal use. Credit appreciated but not required."
    },
  },
  {
    id: 9,
    title: "Discord Sticker Pack",
    description: "10 custom stickers featuring your character or mascot.",
    details: "PNG format with transparency. Sized for Discord (320x320).",
    price: 1800,
    monetization_rate: 1.35,
    commercial_rate: 1.75,
    image_url: "https://cdn.donmai.us/original/96/2b/962b0aaebd6e89a9c5b605b6f0fe6366.png",
    category: "Emotes",
    status: "Open",
    is_new_offer: false,
    avgRating: 4.2,
    ratingCount: 156,
    created_at: new Date(),
    artist: {
      id: 9,
      username: "StickerStar",
      pfp_url: "https://cdn.donmai.us/original/pq/rs/pqrs1234tuvw5678xyza9012bcde3456.jpg",
      bio: "Sticker and emoji artist. Making your server more fun!",
      custom_tos: "For personal Discord servers only."
    },
  },
  {
    id: 10,
    title: "Live2D Animation Rigging",
    description: "Full Live2D rigging for your VTuber model.",
    details: "Includes head tracking, eye movement, mouth sync, and body sway.",
    price: 15000,
    monetization_rate: 2.5,
    commercial_rate: 4.0,
    image_url: "https://cdn.donmai.us/original/bd/6e/bd6e89a9c5b605b6f0fe6366667a8962.gif",
    category: "Animation",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.85,
    ratingCount: 34,
    created_at: new Date(),
    artist: {
      id: 10,
      username: "Live2DPro",
      pfp_url: "https://cdn.donmai.us/original/fg/hi/fghi7890jklm1234nopq5678rstu9012.jpg",
      bio: "Professional Live2D rigger with 100+ VTuber models completed.",
      custom_tos: "Full commercial rights included. Support for 30 days after delivery."
    },
  },
  {
    id: 11,
    title: "Scene Illustration",
    description: "Detailed scene illustration with character and background.",
    details: "High resolution artwork suitable for prints. Includes process timelapse.",
    price: 5500,
    monetization_rate: 1.7,
    commercial_rate: 2.4,
    image_url: "https://cdn.donmai.us/original/89/a9/89a9c5b605b6f0fe6366667a8962b0aa.png",
    category: "Illustration",
    status: "Open",
    is_new_offer: false,
    avgRating: 4.75,
    ratingCount: 203,
    created_at: new Date(),
    artist: {
      id: 11,
      username: "SceneArtist",
      pfp_url: "https://cdn.donmai.us/original/vw/xy/vwxy3456zabc7890defg1234hijk5678.jpg",
      bio: "Bringing your imagination to life with stunning scenes.",
      custom_tos: "Personal use. Print rights available for additional fee."
    },
  },
  {
    id: 12,
    title: "Subscriber Badge Set",
    description: "6-tier subscriber badge set for Twitch or YouTube.",
    details: "Matching theme across all tiers. All required sizes included.",
    price: 1200,
    monetization_rate: 1.25,
    commercial_rate: 1.6,
    image_url: "https://cdn.donmai.us/original/c5/b6/c5b605b6f0fe6366667a8962b0aaebd6.png",
    category: "Emotes",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.1,
    ratingCount: 287,
    created_at: new Date(),
    artist: {
      id: 12,
      username: "BadgeCraft",
      pfp_url: "https://cdn.donmai.us/original/lm/no/lmno9012pqrs3456tuvw7890xyza1234.jpg",
      bio: "Crafting the perfect badges for your community.",
      custom_tos: "For streaming platform use only."
    },
  },
];

// Sort items by rating (highest first)
item.sort((a, b) => b.avgRating - a.avgRating);

const server = express();
const stripe = new Stripe(process.env.STRIPE_SECRET_KEY || "");

server.get('/', (req: Request, res: Response) => {
  res.send("nyallo!");
});


export const getItems = async (req: Request, res: Response) => {
  try {
    setTimeout(() => {
      res.status(200).json(item);
    }, 500);

  } catch (err) {
    console.error("err:", err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
}

export const getItemById = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  const foundItem = item.find(item => item.id === id);

  if (!foundItem) {
    return res.status(404).json({ message: "item not found" });
  }

  try {
    setTimeout(() => {
      res.status(200).json(foundItem);
    }, 500);

  } catch (err) {
    console.error("err:", err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
}

export const processPayment = async (req: Request, res: Response) => {
  const {body} = req;
  try {
    const paymentIntent = await stripe.paymentIntents.create({
      amount: body?.amount,
      currency: body?.currency,
    });
    
    if (paymentIntent.client_secret) {
      console.log("Payment created, sending request to frontend");
      return res.status(200).json({
        message: "Plase confirm your payment",
        client_secret: paymentIntent.client_secret,
      });
    }

    return res.status(200).json({ message: "Payment completed succesfully!"});
  } catch (err: any) {
    console.log('err: ' + err.message);
    return res.status(500).json({ error: err.message })
  }
}

export default server;
