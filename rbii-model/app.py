pdf_loader = PyPDFLoader("C:/Users/Admin/Desktop/Untitled_Folder_1/rbi.pdf")
documents = pdf_loader.load()

raw_text = ''
for doc in documents:
    raw_text += doc.page_content

if len(raw_text) < 10:
    
    raw_text = get_text_from_scanned_pdf(uploaded_file.name)


text_splitter = RecursiveCharacterTextSplitter(
    separators=['\n\n', '\n', '.', ','],
    chunk_size=2000
)

texts = text_splitter.split_text(raw_text)
docs = [Document(page_content=t) for t in texts]

embeddings = HuggingFaceInstructEmbeddings(model_name="hkunlp/instructor-base")

vectorstore = FAISS.from_documents(docs, embeddings)

# Save the FAISS index to a pickle file
with open(f'vector_store.pkl', "wb") as f:
    pickle.dump(vectorstore, f)



query = "what audit trials?";
if query:
    if os.path.exists(f'vector_store.pkl'):
        with open(f'vector_store.pkl', "rb") as f:
            vector_store = pickle.load(f)

        prompt_template = """
            <context>
            {context}
            </context>
            Question: {question}
            Assistant:"""
        prompt = PromptTemplate(
            template=prompt_template, input_variables=["context", "question"]
        )

        chain = RetrievalQA.from_chain_type(
            llm=llm,
            chain_type="stuff",
            retriever=vector_store.as_retriever(search_type="similarity", search_kwargs={"k": 1}),
            return_source_documents=True,
            chain_type_kwargs={"prompt": prompt}
        )

        result = chain({"query": query})
        
        print(result["result"])