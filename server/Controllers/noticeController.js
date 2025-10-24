import noticeModel from "../models/noticeModel.js";

export const createNotice = async (req, res) => {
  try {
    const { title, description } = req.body;
    const newNotice = new noticeModel({ title, description });
    await newNotice.save();
    res.status(200).json({
      success: true,
      data: newNotice,
      message: "notice created successful",
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Server error",
      error: error.message,
    });
  }
};

export const updateNotice = async (req, res) => {
  try {

    const updatedNotice = await noticeModel.findByIdAndUpdate(req.params.id, req.body, { new: true });
    if (!updatedNotice) return res.status(404).json({ message: "Notice not found" });
    res.status(200).json({
      success: true,
      data: updatedNotice,
      message: "notice updated successful",
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "server error",
      error: error.message,
    });
  }
};


export const deleteNotice = async (req, res) => {
  try {
    const deletedNotice = await noticeModel.findByIdAndDelete(req.params.id);

    // Haddii aan la helin document
    if (!deletedNotice) {
      return res.status(404).json({
        success: false,
        message: "Notice not found",
      });
    }

    // Haddii uu si guul leh u tirtiray
    return res.status(200).json({
      success: true,
      message: "Notice deleted successfully",
      data: null,
    });
  } catch (error) {
    return res.status(500).json({
      success: false,
      message: "Server error",
      error: error.message,
    });
  }
};


export const getNotices = async (req, res) => {
  try {
    const notices = await noticeModel.find();

    res.status(200).json({
      success: true,
      data: notices,
      message: "all notices successful",
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "server error",
      error: error.message,
    });
  }
};

export const getNoticeById = async (req, res) => {
  try {
    const notice = await noticeModel.findById(req.params.id);

    if (!notice) {
      return res.status(404).json({
        success: false,
        message: "Notice not found",
      });
    }


    return res.status(200).json({
      success: true,
      data: notice,
    });
  } catch (error) {
    console.error("Error in getNoticeById:", error);
    return res.status(500).json({
      success: false,
      message: "Server error",
      error: error.message,
    });
  }
};

