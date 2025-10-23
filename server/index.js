import express, { Router } from 'express'
import dotenv from 'dotenv'
import connectDB from './config/db.js'
import userRoutes from './routes/userRouts.js'
import cors from 'cors'
const app = express()

dotenv.config()


app.use(express.json())
app.use(cors())
app.use('/api', userRoutes);


app.listen(process.env.PORT, async () => {
  console.log(`Example app listening on port ${process.env.PORT}`);
  await connectDB()
})
