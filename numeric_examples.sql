-- 1. Percentage of Edinburgh Napier University students studying (8) Computer
--    Science who responded STRONGLY AGREE to question 1

SELECT A_STRONGLY_AGREE
FROM nss
WHERE question = 'Q01'
  AND institution = 'Edinburgh Napier University'
  AND subject = '(8) Computer Science';

-- 2. Institution and subject where the score is at least 100 for question 15

SELECT institution, subject
FROM nss
WHERE question = 'Q15'
  AND score >= 100;

-- 3. Institution and score where the score for (8) Computer Science is less
--    than 50 for question 15

SELECT institution, score
FROM nss
WHERE question = 'Q15'
  AND subject = '(8) Computer Science'
  AND score < 50;

-- 4. Subject and total number of responses for question 22 for each of the
--    subjects (8) Computer science and (H) Creative Arts and Design

SELECT subject, SUM(response)
FROM nss
WHERE question = 'Q22'
  AND (subject = '(8) Computer Science' 
    OR subject = '(H) Creative Arts and Design')
GROUP BY subject;

-- 5. Subject and total number of students who put STRONGLY AGREE for question
--    22 for each of the subjects (8) Computer science and (H) Creative Art and
--    Design

SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
FROM nss
WHERE question = 'Q22'
  AND (subject = '(8) Computer Science' 
    OR subject = '(H) Creative Arts and Design')
GROUP BY subject;

-- 6. Subject and percentage of students who put STRONGLY AGREE for question 22
--    for each of the subjects (8) Computer science and (H) Creative Art and
--    Design

SELECT subject, ROUND(SUM(response * A_STRONGLY_AGREE / 100)
                      / SUM(response) * 100, 0)
FROM nss
WHERE question = 'Q22'
  AND (subject = '(8) Computer Science' 
    OR subject = '(H) Creative Arts and Design')
GROUP BY subject;

-- 7. Average scores for question 22 for each institution with Manchester in
--    its name, rounded to the nearest whole number

SELECT institution, ROUND(SUM(response * score / 100)
                          / SUM(response) * 100, 0)
FROM nss
WHERE institution LIKE '%Manchester%'
  AND question = 'Q22'
GROUP BY institution;

-- 8. Institution, total sample size, and sample size of (8) Computer Science
--    students for each institution with Manchester in its name, for question 1

SELECT t_samples.institution, t_samples.total_sample, comp_samples.comp_sample
FROM (SELECT a.institution, SUM(a.sample) total_sample
      FROM nss a
      WHERE a.institution LIKE '%Manchester%'
        AND a.question = 'Q01'
      GROUP BY a.institution) t_samples
  JOIN
     (SELECT b.institution, b.sample comp_sample
      FROM nss b
      WHERE b.institution LIKE '%Manchester%'
        AND b.question = 'Q01'
        AND b.subject = '(8) Computer Science'
      GROUP BY b.institution) comp_samples
  ON (t_samples.institution = comp_samples.institution);
