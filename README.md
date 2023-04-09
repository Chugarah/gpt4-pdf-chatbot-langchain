# Oracle Demo

Welcome to our demo :)

## 1. Conda

This requires that you have installed and configured Miniconda in Windows.
The second step that you have an environment-win.yaml file already setup with channels and decencies.

### Step 1.1 Activate Environment
I recommend using Powershell for these commands.
If conda works you will be able to see (base) in front of your path.
And dont forgett to activate your environment.

1. Run start.bat ?

    ```powershell
    .\Start.bat
    ```

2. Run start.bat.

    ```powershell
    .\install_pnpm.ps1
    ```

3. Restart your shell
4. Activate your env

    ```powershell
    conda activate Oracle-Demo-1
    ```

## 2. Development

1. Clone the repo

    ```python
    git clone https://github.com/Chugarah/gpt4-pdf-chatbot-langchain.git
    cd gpt4-pdf-chatbot-langchain
    pnpm install
    pnpm add sharp
    ```

2. Set up your .env file
   * Copy .env.example into .env Your .env file should look like this:'

    ```python
    OPENAI_API_KEY=

    PINECONE_API_KEY=
    PINECONE_ENVIRONMENT=
    PINECONE_INDEX_NAME=

    ANSWER_LANGUAGE=
    ```

   * Visit [openai](https://help.openai.com/en/articles/4936850-where-do-i-find-my-secret-api-key) to retrieve API keys and insert into your .env file.
   * Visit [pinecone](https://www.pinecone.io/) to create and retrieve your API keys, and also retrieve your environment and index name from the dashboard.

3. In the `config` folder, replace the `PINECONE_NAME_SPACE` with a `namespace` where you'd like
 to store your embeddings on Pinecone when you run `pnpm run ingest`. This namespace will later be used for queries and retrieval.

4. In `utils/makechain.ts` chain change the `QA_PROMPT` for your own usecase. Change `modelName` in `new OpenAIChat` to `gpt-3.5-turbo`, if you don't have access to `gpt-4`. Please verify outside this repo that you have access to `gpt-4`, otherwise the application will not work with it.

## Convert your PDF files to embeddings

**This repo can load multiple PDF files** :)

1. Inside `docs` folder, add your pdf files or folders that contain pdf files.

2. Run the script `npm run ingest` to 'ingest' and embed your docs. If you run into errors troubleshoot below.

3. Check Pinecone dashboard to verify your namespace and vectors have been added.

## Run the app

Once you've verified that the embeddings and content have been successfully added to your Pinecone, you can run the app `pnpm run dev` to launch the local dev environment, and then type a question in the chat interface.

### Docker

You can now run the app using Docker container. Start your favorite terminal and run these commands.

```powershell
cd gpt4-pdf-chatbot-langchain/docker
# Build the image
docker compose build
# Run the container
docker compose up
```

### Native Node

```python
# To build app
pnpm run build
# To start app
pnpm run start
# For development
npm run dev
```


### Native Node under Windows

This is different you can run the App. We have two options. The first
one is to generate vector data to feed into Pinecone. The second one is
to run the webserver and the chatbot.

#### Generate Vector Data

1. Start Powershell or your favorite terminal
2. Run Shell Command

    ```Powershell
    conda activate Oracle-Demo-1
    ```

3. Navigate to your project folder

    ```Powershell
    cd gpt4-pdf-chatbot-langchain
    ```

4. Run the Vector Generator. This is when you want to upload your document to Pinecone.

    ```Powershell
    npm run ingest
    ```

5. To run the webserver and the chatbot

    ```Powershell
    pnpm run build
    ```

## Troubleshooting

In general, keep an eye out in the `issues` and `discussions` section of this repo for solutions.
**General errors**

* Make sure you're running the latest Node version. Run `node -v`
* Try a different PDF or convert your PDF to text first. It's possible your PDF is corrupted, scanned, or requires OCR to convert to text.
* `Console.log` the `env` variables and make sure they are exposed.
* Make sure you're using the same versions of LangChain and Pinecone as this repo.
* Check that you've created an `.env` file that contains your valid (and working) API keys, environment and index name.
* If you change `modelName` in `OpenAIChat` note that the correct name of the alternative model is `gpt-3.5-turbo`
* Make sure you have access to `gpt-4` if you decide to use. Test your openAI keys outside the repo and make sure it works and that you have enough API credits.
* Check that you don't have multiple OPENAPI keys in your global environment. If you do, the local `env` file from the project will be overwritten by systems `env` variable.
* Try to hard code your API keys into the `process.env` variables.
**Pinecone errors**

* Make sure your pinecone dashboard `environment` and `index` matches the one in the `pinecone.ts` and `.env` files.
* Check that you've set the vector dimensions to `1536`.
* Make sure your pinecone namespace is in lowercase.
* Pinecone indexes of users on the Starter(free) plan are deleted after 7 days of inactivity. To prevent this, send an API request to Pinecone to reset the counter before 7 days.
* Retry from scratch with a new Pinecone project, index, and cloned repo.

## Credit

Frontend of this repo is inspired by [langchain-chat-nextjs](https://github.com/zahidkhawaja/langchain-chat-nextjs)
