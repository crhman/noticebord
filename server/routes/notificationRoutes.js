import expess from 'express';
import { getAllNotification, sendNotification } from '../Controllers/notificationController.js';



const router = expess.Router();

router.route("/send-notification").post(sendNotification);
router.route("/getAll_notification").get(getAllNotification);


export default router;