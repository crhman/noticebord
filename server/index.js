import express, { Router } from 'express'
import dotenv from 'dotenv'
import connectDB from './config/db.js'
import userRoutes from './routes/userRouts.js'
import noticeRoute from './routes/noticeRoutes.js'
import cors from 'cors'
const app = express()

dotenv.config()


app.use(express.json())
app.use(cors())
app.use('/api/users', userRoutes);

app.use("/api/notices", noticeRoute)


app.listen(process.env.PORT, async () => {
  console.log(`Example app listening on port ${process.env.PORT}`);
  await connectDB()
})
