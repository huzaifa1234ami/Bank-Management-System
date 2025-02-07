# Bank-Management-System
A web application for bank management developed for the Database Systems Lab at FAST-NU, Lahore. DigiBank features facial recognition for user authentication and provides interfaces for managing accounts, transactions, loans, and credit cards. Developed by Huzaifa Amir, Mannan Ul Haq, M. Hassan Mustansar, and M. Abdullah Waseem in Spring 2024.
### Main Features of DigiBank

1. **Admin Interface**:
   - **Secure Password Login**: Ensure secure access for the admin.
   - **Bank Staff Management**: View, manage, and assign roles to bank staff.
   - **Client Data Viewing**: Access and review clients' data.
   - **Loans Management**: Accept or reject loan applications.
   - **Customer Queries**: Respond to customer queries and questions via the integrated message box.

2. **Bank Staff Interface**:
   - **Secure Password Login**: Ensure secure access for bank staff.
   - **Client Data Management**: Enter, verify, and update client data and account details.
   - **Transaction Management**: Efficiently manage client transaction records.
   - **Loan Management**: Review, process, manage, and track client loans.
   - **Credit Card Management**: View, manage, and respond to client credit card requests.

3. **Client Interface**:
   - **Facial Recognition Login**: Secure login using facial recognition combined with a password.
   - **Money Transfer**: Perform money transfers.
   - **Transfer History**: Access detailed transfer history.
   - **Customer Support**: Contact bank representatives through the integrated message box.
   - **Personal Details**: Check and update personal details.
   - **Account and Card Details**: View account and card details.
     
### Instructions to Run the Project

To run this project on your Laptop/PC, follow these steps:

1. **Install Python**:
   - Download and install Python from the official website.

2. **Face Recognition Setup**:
   - We use face recognition for client authentication with Python in C# using the `python.net` library.
   - We employ the DeepFace library with Google FaceNet models for face recognition.
   
3. **Copy Codes**:
   - Copy the two Python code files provided in the repository folder named `Python Codes`.
   - Paste these files in the following directory: `C:\Program Files\Python312\Lib`.

4. **Install DeepFace Library**:
   - Open Command Prompt and run the following command:
     ```bash
     pip install deepface
     ```
   - Remember that when you run a code using Deepface for the first time on your laptop/PC, it needs to download the respective model. For example, if you are using the FaceNet model, it will take some time to download the model the first time you run the face recognition code.

5. **Database Access via Azure**:
   - We use an Azure server with our SQL Server database.
   - Share your internet IP address with me at `mannanulhaq2004@gmail.com`.
   - I will decide whether to grant you access. Without access, you can only review the code but cannot run it.

6. **Run the Code**:
   - After completing the above steps, you should be able to run the project code on your system.
