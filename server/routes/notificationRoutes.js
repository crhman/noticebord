import expess from 'express';
import { sendNotification } from '../Controllers/notificationController.js';



const router = expess.Router();
router.post('/send-notification', sendNotification )
router.route("/send-notification").post(sendNotification);


export default router;