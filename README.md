# OneHealth

**OneHealth** is an AI-powered healthcare platform that enables users to upload, analyze, and manage medical records intelligently. It combines OCR, NLP, and cloud technologies to transform unstructured medical data into meaningful insights.

## 🚀 Overview

Managing medical records is often messy and inefficient. OneHealth solves this by:

* Digitizing medical reports 📄
* Extracting key medical information 🤖
* Generating smart summaries 🧠
* Improving patient safety with drug interaction checks ⚠️

---

## ✨ Features

* 📤 Upload medical reports (PDF/Image)
* 🔍 OCR-based text extraction
* 🧠 AI/NLP analysis:

  * Disease detection
  * Medication identification
  * Allergy extraction
* 📊 Automatic medical summary generation
* ⚠️ Drug interaction alerts
* ☁️ Cloud-based storage
* 🔐 Secure login & role-based access

---

## 🏗️ Tech Stack

**Frontend**

* Flutter

**Backend**

* FastAPI (Python)

**AI/ML**

* OCR (Tesseract / EasyOCR)
* NLP (custom processing / models)

**Database**

* MongoDB Atlas

**Cloud**

* Firebase / Cloud Storage

---

## 📁 Folder Structure

```
OneHealth-1.0/
│
├── app/
│   ├── main.py
│   ├── database.py
│   ├── routes/
│   ├── models/
│   └── services/
│
├── frontend/
├── requirements.txt
└── README.md
```

---

## ⚙️ Installation & Setup

### 1️⃣ Clone Repository

```bash
git clone https://github.com/PravarKhandelwal16/OneHealth-1.0.git
cd OneHealth-1.0
```

---

### 2️⃣ Backend Setup

```bash
python -m venv venv
venv\Scripts\activate        # Windows
```

```bash
pip install -r requirements.txt
```

---

### 3️⃣ MongoDB Setup

* Create a cluster on MongoDB Atlas
* Add your connection string in `app/database.py`

```python
MONGO_URL = "your_mongodb_connection_string"
```

---

### 4️⃣ Run Backend

```bash
uvicorn app.main:app --reload
```

👉 API runs at: `http://127.0.0.1:8000`

---

### 5️⃣ Run Frontend (Flutter)

```bash
cd frontend
flutter pub get
flutter run
```

---

## 🧠 Workflow

1. Upload medical report
2. OCR extracts text
3. NLP processes medical entities
4. Backend stores structured data
5. AI generates summary & alerts

---

## 🔐 Security

* JWT-based authentication
* Role-based access (Doctor / Patient)
* Secure cloud storage

---

## 👨‍💻 Team

* **Pravar Khandelwal** – Backend & Database
* **Ishan** – Frontend
* **Nischay & Attharv** – AI/ML

---

## 🌟 Future Scope

* 🩺 Doctor consultation integration
* 📈 Predictive health analytics
* 🌍 Multi-language support
* ⌚ Wearable device integration

---

## 📌 Use Case

* Patients can store and access all reports in one place
* Doctors can quickly understand patient history
* Reduces medical errors using AI alerts

---

## 💡 Inspiration

We built OneHealth to simplify healthcare data and make it accessible, intelligent, and safe using modern AI tools.

---
