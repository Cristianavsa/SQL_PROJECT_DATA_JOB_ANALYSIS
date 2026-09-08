/*
Question: What are the most in-demand skills for data analyst?
- Join job postings to inner join table similar to query 2
- Identify  the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/



SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE 
    job_title_short='Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5


/*
English
The top five most demanded Data Analyst skills in 2023 highlight a strong balance between foundational data handling and modern analytical capabilities. SQL leads by a wide margin with over 92,000 job postings, confirming its role as the essential skill for querying and managing data. Excel follows closely, showing that traditional spreadsheet analysis remains deeply embedded in business workflows. Python ranks third, reflecting its importance for automation, data cleaning, and advanced analytics. Tableau and Power BI round out the list as the primary visualization tools, demonstrating that employers increasingly expect analysts to communicate insights through interactive dashboards and clear data storytelling. Overall, the data shows that successful analysts must combine strong core skills with modern programming and visualization tools to meet industry expectations.

Español
Las cinco habilidades más demandadas para Data Analysts en 2023 muestran un equilibrio claro entre competencias fundamentales y herramientas modernas de análisis. SQL encabeza la lista con más de 92,000 ofertas laborales, confirmando que es la habilidad esencial para consultar y gestionar datos. Excel ocupa el segundo lugar, lo que demuestra que el análisis en hojas de cálculo sigue siendo clave en los procesos empresariales. Python aparece en tercer lugar, reflejando su importancia para la automatización, la limpieza de datos y el análisis avanzado. Tableau y Power BI completan el conjunto como las principales herramientas de visualización, indicando que las empresas esperan que los analistas comuniquen hallazgos mediante dashboards interactivos y narrativas claras basadas en datos. En conjunto, estos resultados muestran que un analista exitoso debe combinar habilidades básicas sólidas con programación moderna y herramientas de visualización para cumplir con las expectativas del mercado.

  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
*/