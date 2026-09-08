/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analyst and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE 
    job_title_short='Data Analyst' AND 
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*

English
The top‑paying skills for data‑related roles in 2023 reveal a strong shift toward engineering‑heavy, AI‑driven, and cloud‑focused competencies rather than traditional analyst tools. High‑salary skills such as Terraform, Kafka, Airflow, Puppet, and Ansible point to the growing importance of automation, orchestration, and scalable data infrastructure. Meanwhile, machine learning frameworks like TensorFlow, PyTorch, Keras, MXNet, and Hugging Face highlight that roles involving model development and deployment command significantly higher compensation. Languages such as Golang, Scala, and Perl also appear, reflecting demand for advanced programming in distributed systems and high‑performance environments. Overall, the trend shows that the highest‑paying “data analyst” roles are actually hybrid positions that blend analytics with data engineering, MLOps, and AI specialization — areas where technical depth drives salaries well above traditional analyst expectations.

Español
Las habilidades mejor pagadas en roles relacionados con datos en 2023 muestran una clara transición hacia competencias más técnicas, centradas en ingeniería, inteligencia artificial y arquitectura en la nube, en lugar de las herramientas tradicionales de análisis. Habilidades como Terraform, Kafka, Airflow, Puppet y Ansible indican la creciente importancia de la automatización, la orquestación y la infraestructura de datos a gran escala. A la vez, frameworks de machine learning como TensorFlow, PyTorch, Keras, MXNet y Hugging Face evidencian que los puestos que involucran desarrollo y despliegue de modelos reciben salarios considerablemente más altos. Lenguajes como Golang, Scala y Perl también aparecen, reflejando la demanda de programación avanzada en sistemas distribuidos y entornos de alto rendimiento. En conjunto, la tendencia muestra que los roles “mejor pagados” para analistas de datos son en realidad posiciones híbridas que combinan análisis con ingeniería de datos, MLOps y especialización en IA — áreas donde la profundidad técnica impulsa salarios muy superiores a los de un analista tradicional.

[
  {
    "skills": "svn",
    "avg_salary": "400000.00"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000.00"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.50"
  },
  {
    "skills": "golang",
    "avg_salary": "155000.00"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000.00"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633.33"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500.00"
  },
  {
    "skills": "terraform",
    "avg_salary": "146733.83"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500.00"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126.00"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999.16"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820.00"
  },
  {
    "skills": "keras",
    "avg_salary": "127013.33"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226.20"
  },
  {
    "skills": "perl",
    "avg_salary": "124685.75"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370.00"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950.00"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120646.83"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118406.68"
  },
  {
    "skills": "notion",
    "avg_salary": "118091.67"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117965.60"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116711.75"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387.26"
  },
  {
    "skills": "scala",
    "avg_salary": "115479.53"
  }
]
*/