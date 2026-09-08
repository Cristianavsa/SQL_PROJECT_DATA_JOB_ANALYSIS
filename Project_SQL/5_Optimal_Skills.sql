/*
Answer: What are the most optimal skills to learn (it is high demand and a high-paying skill)?
- Identify skills in high demand and associated  with high average salaries for Data Analyst roles.
- Concentrates on remote positions with specified salaries.
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insigths for career development in data analysis.
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
    WHERE 
        job_title_short='Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
    WHERE 
        job_title_short='Data Analyst' AND 
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id=average_salary.skill_id
WHERE
    demand_count>10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25



-- Rewriting the last query more conciseley
/*
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE 
    job_title_short='Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
avg_salary DESC,
demand_count DESC
LIMIT 25
*/



/*
English 
The most optimal skills to learn for Data Analyst career growth are those that combine strong market demand with high average salaries, and your dataset highlights exactly which ones offer the best return on investment. Skills like SQL and Python remain essential due to their extremely high demand, providing job security and broad applicability across industries. At the same time, modern cloud and big‑data tools such as Snowflake, AWS, Azure, Spark, Hadoop, and BigQuery show strong demand paired with salaries above $105k, making them powerful accelerators for career advancement. Visualization platforms like Tableau and Looker also appear with high demand and competitive pay, reinforcing the importance of data storytelling. Collaboration tools such as Jira and Confluence, along with workflow automation tools like Alteryx and SSIS, round out the list by supporting enterprise‑level analytics environments. Overall, the most optimal skill strategy blends foundational analytics (SQL, Python) with cloud data warehousing, big‑data processing, and modern BI tools—unlocking both job stability and higher earning potential, especially in remote roles with specified salaries.

Español
Las habilidades más óptimas para impulsar una carrera en análisis de datos son aquellas que combinan una alta demanda laboral con salarios competitivos, y tu conjunto de datos identifica claramente cuáles ofrecen el mayor beneficio estratégico. Habilidades fundamentales como SQL y Python siguen siendo indispensables debido a su enorme demanda, garantizando seguridad laboral y versatilidad en múltiples sectores. Al mismo tiempo, herramientas modernas de nube y big data como Snowflake, AWS, Azure, Spark, Hadoop y BigQuery muestran una demanda sólida junto con salarios superiores a los $105k, convirtiéndose en motores clave para avanzar profesionalmente. Plataformas de visualización como Tableau y Looker también destacan por su alta demanda y buenos ingresos, reforzando la importancia de comunicar insights de manera efectiva. Herramientas de colaboración como Jira y Confluence, junto con soluciones de automatización como Alteryx y SSIS, complementan el perfil requerido en entornos empresariales modernos. En conjunto, la estrategia óptima combina habilidades básicas de análisis (SQL, Python) con tecnologías de nube, procesamiento de datos masivos y herramientas de BI, ofreciendo tanto estabilidad laboral como mayores oportunidades salariales, especialmente en roles remotos con sueldos definidos.
[
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114153.12"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "113001.94"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "111577.72"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "110888.27"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "108331.04"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "107968.80"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "107931.30"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "106439.84"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "105695.51"
  },
  {
    "skill_id": 201,
    "skills": "alteryx",
    "demand_count": "17",
    "avg_salary": "105579.57"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "105399.62"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "105237.60"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103855.35"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101511.85"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "100964.19"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "100932.78"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "100213.87"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "98707.80"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "28",
    "avg_salary": "98019.82"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "97978.08"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "97266.97"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "97234.75"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "398",
    "avg_salary": "96435.33"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "96191.42"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_count": "24",
    "avg_salary": "93844.97"
  }
]

*/