import mongoose from 'mongoose'

const notificationSchema =  mongoose.Schema({
    notificationId: {
        type: String,
        required: [true, 'Notification ID is required'],
        unique: true
    },
    title: {
        type: String,
        required: [true, 'Title is required'],
        trim: true
    },
    message: {
        type: String,
        trim: true
    },
}, { timestamps: true });


const Notification = mongoose.model('Notification', notificationSchema);

export default Notification;