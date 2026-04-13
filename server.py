from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return "Bienvenido a EduPhisher-Facebook (Simulación educativa)"

@app.route('/facebook', methods=['GET', 'POST'])
def facebook_login():
    if request.method == 'POST':
        user = request.form.get('username')
        with open("logs/access.log", "a") as f:
            f.write(f"Intento en Facebook con usuario: {user}\n")
        return "⚠️ Simulación de phishing: nunca ingreses tus datos en sitios sospechosos."
    return render_template("facebook.html")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)