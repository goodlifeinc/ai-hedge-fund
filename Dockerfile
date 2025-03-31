FROM python:3.13-slim

ENV PATH="${PATH}:/root/.local/bin"

WORKDIR /ai-hedge-fund

COPY . .

RUN apt update && apt install -y build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && pip install poetry \
    && poetry lock && poetry install

EXPOSE 7860

ENTRYPOINT ["poetry", "run", "python", "-u", "src/gradio_app.py"]

# CMD ["--ticker", "AAPL"]
