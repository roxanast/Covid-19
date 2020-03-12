--Malignancy

--AUTHOR: Seng Chan You<applegna@gmail.com>
--Date:2020-03-10
/*
Reference
Greenbaum, Adena H., Jufu Chen, Carrie Reed, Suzanne Beavers, David Callahan, Deborah Christensen, Lyn Finelli, and Alicia M. Fry. “Hospitalizations for Severe Lower Respiratory Tract Infections.” Pediatrics 134, no. 3 (September 2014): 546–54. https://doi.org/10.1542/peds.2014-0244.
*/
SELECT concept.domain_id, concept.concept_id, concept.concept_name, concept.vocabulary_id,
con_rel.source_vocabulary, con_rel.source_code, con_rel.source_concept_name,concept.standard_concept AS S
FROM
(SELECT rel.concept_id_2 AS concept_id, concept.concept_id AS source_concept_id, concept.concept_name AS source_concept_name, vocabulary_id AS source_vocabulary, concept_code AS source_code
FROM @vocabulary_database_schema.concept LEFT JOIN
	 @vocabulary_database_schema.concept_relationship AS rel
	 ON CONCEPT.concept_id=rel.concept_id_1
WHERE vocabulary_id = 'ICD9CM'
AND rel.relationship_id='Maps to'
AND rel.invalid_reason IS NULL
AND ( CONCEPT_CODE IN  ('140','140','140.1','140.3','140.4','140.5','140.6','140.8','140.9','141','141','141.1','141.2','141.3','141.4','141.5','141.6','141.8','141.9','142','142','142.1','142.2','142.8','142.9','143','143','143.1','143.8','143.9','144','144','144.1','144.8','144.9','145','145','145.1','145.2','145.3','145.4','145.5','145.6','145.8','145.9','146','146','146.1','146.2','146.3','146.4','146.5','146.6','146.7','146.8','146.9','147','147','147.1','147.2','147.3','147.8','147.9','148','148','148.1','148.2','148.3','148.8','148.9','149','149','149','149.1','149.8','149.8','149.9','149.9','150','150','150.1','150.2','150.3','150.4','150.5','150.8','150.9','151','151','151.1','151.2','151.3','151.4','151.5','151.6','151.8','151.9','152','152','152.1','152.2','152.3','152.8','152.9','153','153','153.1','153.2','153.3','153.4','153.5','153.6','153.7','153.8','153.9','154','154','154.1','154.2','154.3','154.8','155','155','155.1','155.2','156','156','156.1','156.2','156.8','156.9','157','157','157.1','157.2','157.3','157.4','157.8','157.9','158','158','158.8','158.9','159','159','159.1','159.8','159.9','160','160','160.1','160.2','160.3','160.4','160.5','160.8','160.9','161','161','161.1','161.2','161.3','161.8','161.9','162','162','162.2','162.3','162.4','162.5','162.8','162.9','163','163','163.1','163.8','163.9','164','164','164.1','164.2','164.3','164.8','164.9','165','165','165.8','165.9','170','170','170','170.1','170.2','170.3','170.4','170.5','170.6','170.7','170.8','170.9','170.9','171','171','171.2','171.3','171.4','171.5','171.6','171.7','171.8','171.9','172','172','172.1','172.2','172.3','172.4','172.5','172.6','172.7','172.8','172.9','173','173','173','173.01','173.02','173.09','173.1','173.1','173.11','173.12','173.19','173.2','173.2','173.21','173.22','173.29','173.3','173.3','173.31','173.32','173.39','173.4','173.4','173.41','173.41','173.42','173.42','173.49','173.5','173.5','173.51','173.52','173.59','173.6','173.6','173.61','173.62','173.69','173.7','173.7','173.71','173.72','173.79','173.8','173.8','173.81','173.82','173.89','173.9','173.9','173.91','173.92','173.99','174','174','174.1','174.2','174.3','174.4','174.5','174.6','174.6','174.8','174.9','175','175','175.9','176','176','176.1','176.2','176.3','176.4','176.5','176.8','176.9','179','180','180','180.1','180.8','180.9','181','182','182','182.1','182.8','183','183','183.2','183.3','183.4','183.5','183.8','183.9','184','184','184.1','184.2','184.3','184.4','184.8','184.9','185','186','186','186.9','187','187.1','187.2','187.3','187.4','187.5','187.6','187.7','187.8','187.9','188','188','188.1','188.2','188.3','188.4','188.5','188.6','188.7','188.8','188.9','189','189','189.1','189.2','189.3','189.4','189.8','189.9','190','190','190.1','190.2','190.3','190.4','190.5','190.6','190.7','190.8','190.9','191','191','191.1','191.2','191.3','191.4','191.5','191.6','191.7','191.8','191.9','192','192','192.1','192.2','192.3','192.8','192.9','193','194','194','194.1','194.3','194.4','194.5','194.6','194.8','194.9','195','195','195','195.1','195.1','195.2','195.3','195.4','195.5','195.8','196','196','196.1','196.2','196.3','196.5','196.6','196.8','196.9','197','197','197.1','197.2','197.3','197.4','197.5','197.6','197.7','197.8','198','198','198.1','198.2','198.3','198.4','198.5','198.6','198.7','198.8','198.81','198.82','198.89','199','199','199.1','199.2','200','200','200','200.01','200.02','200.03','200.04','200.05','200.06','200.07','200.08','200.1','200.1','200.11','200.12','200.13','200.14','200.15','200.16','200.17','200.18','200.2','200.2','200.21','200.22','200.23','200.24','200.25','200.26','200.27','200.28','200.3','200.3','200.31','200.31','200.32','200.32','200.33','200.33','200.34','200.34','200.35','200.35','200.36','200.36','200.37','200.38','200.38','200.4','200.4','200.41','200.41','200.42','200.42','200.43','200.43','200.44','200.44','200.45','200.45','200.46','200.46','200.47','200.48','200.48','200.5','200.5','200.51','200.51','200.52','200.52','200.53','200.53','200.54','200.54','200.55','200.55','200.56','200.56','200.57','200.57','200.58','200.58','200.6','200.6','200.61','200.61','200.62','200.62','200.63','200.63','200.64','200.64','200.65','200.65','200.66','200.66','200.67','200.67','200.68','200.68','200.7','200.7','200.71','200.71','200.72','200.72','200.73','200.73','200.74','200.74','200.75','200.75','200.76','200.76','200.77','200.77','200.78','200.78','200.8','200.8','200.81','200.81','200.82','200.82','200.83','200.83','200.84','200.84','200.85','200.85','200.86','200.86','200.87','200.87','200.88','200.88','201','201','201','201.01','201.02','201.03','201.04','201.05','201.06','201.07','201.08','201.1','201.1','201.11','201.12','201.13','201.14','201.15','201.16','201.17','201.18','201.2','201.2','201.21','201.22','201.23','201.24','201.25','201.26','201.27','201.28','201.4','201.4','201.41','201.42','201.43','201.44','201.45','201.46','201.47','201.48','201.5','201.5','201.51','201.52','201.53','201.54','201.55','201.56','201.57','201.58','201.6','201.6','201.61','201.62','201.63','201.64','201.65','201.66','201.67','201.68','201.7','201.7','201.71','201.72','201.73','201.74','201.75','201.76','201.77','201.78','201.9','201.9','201.91','201.92','201.93','201.94','201.95','201.96','201.97','201.98','202','202','202','202.01','202.02','202.03','202.04','202.05','202.06','202.07','202.08','202.1','202.1','202.11','202.12','202.13','202.14','202.15','202.16','202.17','202.18','202.2','202.2','202.21','202.22','202.23','202.24','202.25','202.26','202.27','202.28','202.3','202.3','202.31','202.32','202.33','202.34','202.35','202.36','202.37','202.38','202.4','202.4','202.41','202.42','202.43','202.44','202.45','202.46','202.47','202.48','202.5','202.5','202.51','202.52','202.53','202.54','202.55','202.56','202.57','202.58','202.6','202.6','202.61','202.62','202.63','202.64','202.65','202.66','202.67','202.68','202.7','202.7','202.71','202.71','202.72','202.72','202.73','202.73','202.74','202.74','202.75','202.75','202.76','202.76','202.77','202.77','202.78','202.78','202.8','202.8','202.81','202.82','202.83','202.84','202.85','202.86','202.87','202.88','202.9','202.9','202.91','202.91','202.92','202.92','202.93','202.93','202.94','202.94','202.95','202.95','202.96','202.96','202.97','202.97','202.98','202.98','203','203','203','203.01','203.02','203.1','203.1','203.11','203.12','203.8','203.8','203.81','203.82','204','204','204','204.01','204.02','204.1','204.1','204.11','204.12','204.2','204.2','204.21','204.22','204.8','204.8','204.81','204.82','204.9','204.9','204.91','204.92','205','205','205','205.01','205.02','205.1','205.1','205.11','205.12','205.2','205.2','205.21','205.22','205.3','205.3','205.31','205.32','205.8','205.8','205.81','205.82','205.9','205.9','205.91','205.92','206','206','206','206.01','206.02','206.1','206.1','206.11','206.11','206.12','206.2','206.2','206.21','206.21','206.22','206.8','206.8','206.81','206.81','206.82','206.9','206.9','206.91','206.91','206.92','207','207','207','207.01','207.02','207.1','207.1','207.11','207.12','207.2','207.2','207.21','207.22','207.8','207.8','207.81','207.82','208','235','235','235.1','235.2','235.3','235.4','235.5','235.6','235.7','235.8','235.9','236','236','236.1','236.2','236.3','236.4','236.5','236.6','236.7','236.9','236.9','236.91','236.99','237','237','237.1','237.2','237.3','237.4','237.5','237.6','237.7','237.7','237.71','237.72','237.73','237.79','237.9','238')
     OR CONCEPT_CODE LIKE '235%'
	 OR CONCEPT_CODE LIKE '236%'
	 OR CONCEPT_CODE LIKE '237%'
	 OR CONCEPT_CODE LIKE '238%'
	 OR CONCEPT_CODE LIKE '960.7%'
	 OR CONCEPT_CODE LIKE 'V58.0%'
	 OR CONCEPT_CODE LIKE 'V58.1%'
	 )
) AS con_rel
LEFT JOIN @vocabulary_database_schema.concept
ON con_rel.concept_id = concept.concept_id
ORDER BY SOURCE_CODE ASC
;
