import Notification from "../models/notifiationModel.js";
import OneSignal from "onesignal-node";




const client = new OneSignal.Client(
  process.env.ONE_SIGNAL_APP_ID,
  process.env.ONE_SIGNAL_REST_API_KEY
);


 export const sendNotification = async (req, res) => {

    try {
        const { title, message, imageUrl } = req.body;

  

  

  const notificationBody = {
    contents: {
      en: message,
    },
    headings: {
      en: title,
    },
    // include_external_user_ids: adminIds,
    included_segments: ["All"],
    priority: 10,
    android_channel_id: "beae5821-f86a-44a0-8ae3-2f21ec1f3795",

    ...(imageUrl && { big_picture: imageUrl }),
  };
   const response = await client.createNotification(notificationBody);
const id =  response.body["id"];
   

        const newNotification = new Notification({
          notificationId: id,
        title,
        message,
        imageUrl,
    });

   const savedNotification = await newNotification.save();

    res.status(200).json({ success: true, message: 'Notification sent successfully', data: savedNotification });
   
        
    } catch (error) {
        console.log(error);
        
    }
  
 
};


// export const getAllUsers = async (req, res) => {
//     try {
//         const users = await User.find({});
//         res.status(200).json({      
//             success: true,
//             data: users,
//             message: "Users retrieved successfully"
//         });
//     } catch (error) {
//         res.status(500).json({
//             success: false, 
//             message: "Server error"
//         });
//     }
// }


export const getAllNotification = async (req, res) => {
    try {
        const notification = await Notification.find({});
        res.status(200).json({      
            success: true,
            data: notification ,
            message: "notification retrived successfully"
        });
    } catch (error) {
        res.status(500).json({
            success: false, 
            message: "Server error"
        });
    }
}
