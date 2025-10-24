import express from "express"
import { createNotice, deleteNotice, getNoticeById, getNotices, updateNotice } from "../Controllers/noticeController.js"

const router = express.Router()



router.route("/").get(getNotices).post(createNotice);

router.route("/:id").get(getNoticeById).put(updateNotice).delete(deleteNotice);




export default router