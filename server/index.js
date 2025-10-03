import express from 'express'
import dotenv from 'dotenv'
import connectDB from './config/db.js'
const app = express()

dotenv.config()

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(process.env.PORT, async () => {
  console.log(`Example app listening on port ${process.env.PORT}`);
  await connectDB()
})
