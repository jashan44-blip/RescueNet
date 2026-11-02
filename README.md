# RescueNet (local demo)

A React + Vite frontend and Flask + SQLite backend. All responders/incidents are simulated. This prototype does not contact emergency services.

## Windows quick start

1. Extract this ZIP. Open the extracted `rescuenet` folder in VS Code (the folder containing `START_BACKEND.bat`, `START_FRONTEND.bat`, `backend`, and `frontend`).
2. Create `backend/.env` by copying `backend/.env.example`. Put your own Gemini key on the `GEMINI_API_KEY=` line. Never share or commit `.env`.
3. Double-click `START_BACKEND.bat` (or run it from a terminal). Keep that window open.
4. Double-click `START_FRONTEND.bat` (or run it from a second terminal). Keep that window open.
5. Open the Vite URL shown in the frontend terminal, normally http://localhost:5173.

If using terminals manually from the project root:
- Backend: `cd backend`, `python -m pip install -r requirements.txt`, `python app.py`
- Frontend: in a second terminal, `cd frontend`, `npm install`, `npm run dev`

The Flask API health endpoint is http://127.0.0.1:5000/api/health. The API root at http://127.0.0.1:5000/ returns a small status response; the website itself is served by Vite.

## Gemini troubleshooting
- Put the key after `GEMINI_API_KEY=` in `backend/.env`; do not share or paste it into chat.
- Restart `START_BACKEND.bat` after changing the key. The backend reads its environment when it starts.
- Open **Settings** for Gemini status, then use **AI Emergency Assistant** to test a real classification request. A configured key is not considered verified until a request succeeds.
- If the request fails, check the displayed status: the key/API access (401/403), model name (404), quota/rate limit (429), and network/timeout are reported separately. Confirm the Gemini API is enabled for the key's project.
- Rule-based classification remains available when Gemini cannot be reached.

## Requirements
- Python 3.10+ and Node.js LTS installed and available on PATH.
- Gemini key from https://aistudio.google.com/api-keys (optional; rule-based fallback remains available without it).

## Command center demo
- The sidebar links to the overview, live incident map, incident queue, ambulance dispatch, teams, first aid/SOS, AI assistant, route planner, analytics, and settings.
- Incident and responder records refresh from the local backend. Ambulance dispatch, routes, and response units are simulated.
- Hospital map pins are sample placeholders, not verified facilities or a source for real emergency navigation.
- If the dispatch API is unreachable, SOS can prepare a message in the device's SMS app for a trusted contact. The user must review and send it; this web app has no SMS gateway and cannot send messages automatically.
- SOS caller contact details and incident location are stored in the local SQLite database and shown on the simulated responder dashboard.

## Safety
Demo only. Do not rely on this prototype for real emergencies. In an actual emergency, contact official local emergency services.
