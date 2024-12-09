# Cebu Institute of Technology - University

CSIT327-G7

Prepared by:
Edgar B. Quindao Jr.

## Throttle Junkies (Digital Motorcycle Sales System )

is designed to provide a seamless and efficient experience for users interested in exploring and purchasing motorcycles. MotoDeal combines essential features like product exploration, secure checkout, and user authentication, ensuring a comprehensive and user-friendly platform. With its robust functionality, MotoDeal simplifies the buying process, supports social sharing, and offers administrative tools for managing the system effectively.

MotoDeal aims to make the process of discovering, purchasing, and managing motorcycles straightforward and engaging, catering to both casual buyers and motorcycle enthusiasts.

## Installation/How to run the program

1. Download throttlejunkies-3.sql and import it at your Xampp Database
2. Make a new branch:
```bash
git clone https://github.com/EdQuinJr/Throttle-Junkies-CSIT327.git
```
3. Install the requirements:
```bash
pip install -r requirements.txt
```
4. 1st Step. Go the im2_finalproject's folder
```bash
cd im2_finalproject
```
5. 2nd Step. Go to throttlejunkies
```bash
cd throttlejunkies
```
6. 3sd Step. Start the server
```bash
py manage.py runserver
```
## How to create a Superuser/Admin
```bash
py manage.py createsuperuser
```
## Required code and documentary repository
1. Functional Requirement
2. Gantt Chart
3. Erd
4. UI/UX Design

## Functional Requirement
**Explore Motorcycles
**Users can browse through a variety of motorcycles available on the platform, complete with detailed specifications, prices, and images. The system allows filtering based on criteria such as brand, engine capacity, and price range.
Inputs: Motorcycle preferences (e.g., brand, price range, engine type).

Outputs: List of motorcycles with specifications, pricing, and images.

Key Features: Motorcycle browsing, filtering options, detailed product descriptions.

**Purchase/Checkout Function
**MotoDeal includes a secure and efficient purchase and checkout process. Users can add motorcycles cart, review their selections, and complete purchases.
Inputs: Selected products (e.g., motorcycles), payment details.

Outputs: Order confirmation, transaction receipt

Key Features: Shopping cart, secure checkout

**User Authentication
**Users must create an account to access personalized features such as order history and saved preferences. The system ensures secure access through email-based registration and password protection.
Inputs: Email address, password, account details.

Outputs: Account creation confirmation, login verification, error messages for invalid inputs.

Key Features: Sign-up/Login, secure access.

**Search Function
**The platform offers a robust search function that allows users to quickly find motorcycles, parts, or accessories. Search results can be refined using keywords, categories, and filters to ensure the most relevant results are displayed.
Inputs: Search keywords, filters (e.g., category, brand).

Outputs: Search results with relevant products, sorted and filtered based on user input.

Key Features: Keyword search, advanced filtering, result sorting.

## Gantt Chart Link:
```bash
https://docs.google.com/spreadsheets/d/1g9aUMmxKDkO0YkCprO1I4A7qHXC6M0IW27A7Obip2jE/edit?usp=sharing
```
## ERD Link:
```bash
https://online.visual-paradigm.com/share.jsp?id=333535303535352d33
```
## UI/UX Link:
```bash
https://www.figma.com/design/tDazcucA4EPBBaZhFUY0F9/Throttle-Junkies-UI%2FUX?node-id=0-1&t=h4Ar09j3O7VMRa3p-1
```
