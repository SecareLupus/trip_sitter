part of 'main.dart';

const SUBSTANCES = <String>[
  'Cannabis',
  'Psilocybin mushrooms',
  'LSD',
  'MDMA',
  'Cocaine',
  'Alcohol',
  'Ayahuasca',
  'DMT',
  'Heroin',
  'Ketamine',
  'Kratom',
  'Mescaline',
  'Methamphetamine',
  'Nicotine',
  'Nitrous',
  'Opioids',
  'PCP',
  'Salvia divinorum',
  'Substituted cathinones',
  'Synthetic cannabinoid',
  '1,4-Butanediol',
  '1B-LSD',
  '1P-ETH-LAD',
  '1P-LSD',
  '1V-LSD',
  '1cP-AL-LAD',
  '1cP-LSD',
  '2,5-DMA',
  '2-Aminoindane',
  '2-FA',
  '2-FEA',
  '2-FMA',
  '2-Fluorodeschloroketamine',
  '25B-NBOH',
  '25B-NBOMe',
  '25C-NBOH',
  '25C-NBOMe',
  '25D-NBOMe',
  '25H-NBOMe',
  '25I-NBOH',
  '25I-NBOMe',
  '25N-NBOMe',
  '25x-NBOH',
  '25x-NBOMe',
  '2C-B',
  '2C-B-FLY',
  '2C-C',
  '2C-D',
  '2C-E',
  '2C-H',
  '2C-I',
  '2C-P',
  '2C-T',
  '2C-T-2',
  '2C-T-21',
  '2C-T-7',
  '2C-T-x',
  '2C-x',
  '2M2B',
  '3,4-CTMP',
  '3-FA',
  '3-FEA',
  '3-FMA',
  '3-FPM',
  '3-HO-PCE',
  '3-HO-PCP',
  '3-MMC',
  '3-Me-PCP',
  '3-MeO-PCE',
  '3-MeO-PCMo',
  '3-MeO-PCP',
  '3C-E',
  '4-AcO-DET',
  '4-AcO-DMT',
  '4-AcO-DiPT',
  '4-AcO-MET',
  '4-AcO-MiPT',
  '4-FA',
  '4-FMA',
  '4-HO-DET',
  '4-HO-DPT',
  '4-HO-DiPT',
  '4-HO-EPT',
  '4-HO-MET',
  '4-HO-MPT',
  '4-HO-MiPT',
  '4-MeO-PCP',
  '4F-EPH',
  '4F-MPH',
  '5-APB',
  '5-Hydroxytryptophan',
  '5-MAPB',
  '5-MeO-DALT',
  '5-MeO-DMT',
  '5-MeO-DiBF',
  '5-MeO-DiPT',
  '5-MeO-MiPT',
  '5F-AKB48',
  '5F-PB-22',
  '6-APB',
  '6-APDB',
  '8-Chlorotheophylline',
  'A-PHP',
  'A-PVP',
  'AB-FUBINACA',
  'AL-LAD',
  'ALD-52',
  'APICA',
  'Acetylfentanyl',
  'Adrafinil',
  'Alimemazine',
  'Allylescaline',
  'Alpha-GPC',
  'Alprazolam',
  'Amanita muscaria',
  'Amphetamine',
  'Anadenanthera peregrina',
  'Aniracetam',
  'Antihistamine',
  'Antipsychotic',
  'Armodafinil',
  'Arylcyclohexylamines',
  'Atropa belladonna',
  'Baclofen',
  'Banisteriopsis caapi',
  'Barbiturates',
  'Benzodiazepines',
  'Benzydamine',
  'Bromantane',
  'Bromo-DragonFLY',
  'Bufotenin',
  'Buprenorphine',
  'Butylone',
  'Cabergoline',
  'Caffeine',
  'Cake',
  'Cannabidiol',
  'Cannabinoid',
  'Carisoprodol',
  'Changa',
  'Choline bitartrate',
  'Citicoline',
  'Classical psychedelic',
  'Clonazepam',
  'Clonazolam',
  'Clonidine',
  'Codeine',
  'Coluracetam',
  'Creatine',
  'Cyclazodone',
  'DET',
  'DOB',
  'DOC',
  'DOI',
  'DOM',
  'DOx',
  'DPT',
  'Datura',
  'Deliriant',
  'Depressant',
  'Deschloroetizolam',
  'Deschloroketamine',
  'Desomorphine',
  'Desoxypipradrol',
  'Dexamphetamine',
  'Dextropropoxyphene',
  'DiPT',
  'Diarylethylamines',
  'Diazepam',
  'Dichloropane',
  'Diclazepam',
  'Dihydrocodeine',
  'Diphenhydramine',
  'Diphenidine',
  'Dissociatives',
  'EPT',
  'ETH-CAT',
  'ETH-LAD',
  'Efavirenz',
  'Entactogens',
  'Entheogen',
  'Ephenidine',
  'Ephylone',
  'Ergotamine',
  'Escaline',
  'Etazene',
  'Ethylmorphine',
  'Ethylone',
  'Ethylphenidate',
  'Etizolam',
  'F-Phenibut',
  'Fentanyl',
  'Flualprazolam',
  'Flubromazepam',
  'Flubromazolam',
  'Flunitrazepam',
  'Flunitrazolam',
  'GBL',
  'GHB',
  'Gabapentin',
  'Gabapentinoids',
  'Galantamine',
  'HXE',
  'Hallucinogens',
  'Haloperidol',
  'Harmala alkaloid',
  'Hexedrone',
  'Hydrocodone',
  'Hydromorphone',
  'Hyoscyamus niger (botany)',
  'Hypnotic',
  'Ibogaine',
  'Inhalants',
  'Isopropylphenidate',
  'JWH-018',
  'JWH-073',
  'LAE-32',
  'LSA',
  'LSM-775',
  'LSZ',
  'Lisdexamfetamine',
  'Lorazepam',
  'Lysergamides',
  'MAOI',
  'MCPP',
  'MDA',
  'MDAI',
  'MDEA',
  'MDPV',
  'MET',
  'MPT',
  'MXiPr',
  'Mandragora',
  'Mandragora officinarum (botany)',
  'Melatonin',
  'Memantine',
  'Mephedrone',
  'Methadone',
  'Methallylescaline',
  'Methaqualone',
  'Methiopropamine',
  'Methoxetamine',
  'Methoxphenidine',
  'Methylnaphthidate',
  'Methylone',
  'Methylphenidate',
  'Metizolam',
  'Mexedrone',
  'MiPLA',
  'MiPT',
  'Midazolam',
  'Mirtazapine',
  'Modafinil',
  'Morning glory',
  'Morphine',
  'Myristicin',
  'N-Acetylcysteine',
  'N-Ethylhexedrone',
  'N-Methylbisfluoromodafinil',
  'NBx',
  'NEP',
  'NM-2-AI',
  'Naloxone',
  'Nifoxipam',
  'Nootropic',
  'O-Desmethyltramadol',
  'Omberacetam',
  'Oxiracetam',
  'Oxycodone',
  'Oxymorphone',
  'PARGY-LAD',
  'PCE',
  'PMA',
  'PMMA',
  'PRO-LAD',
  'Peganum harmala',
  'Pentedrone',
  'Pentobarbital',
  'Pethidine',
  'Phenethylamine (compound)',
  'Phenibut',
  'Phenobarbital',
  'Phenylpiracetam',
  'Piper nigrum (botany)',
  'Piracetam',
  'Poppers',
  'Pramiracetam',
  'Pregabalin',
  'Prochlorperazine',
  'Prodrug',
  'Prolintane',
  'Propylhexedrine',
  'Proscaline',
  'Psilocin',
  'Psilocybe cubensis',
  'Psychedelics',
  'Pyrazolam',
  'Quetiapine',
  'RIMA',
  'Racetams',
  'Risperidone',
  'SAM-e',
  'STS-135',
  'Salvinorin A',
  'Salvinorin B methoxymethyl ether',
  'Secobarbital',
  'Sedative',
  'Selective serotonin reuptake inhibitor',
  'Serotonergic psychedelic',
  'Serotonin',
  'Serotonin-norepinephrine reuptake inhibitor',
  'Stimulants',
  'Substituted aminorexes',
  'Substituted amphetamines',
  'Substituted phenidates',
  'Substituted tryptamines',
  'Sufentanil',
  'THJ-018',
  'THJ-2201',
  'TMA-2',
  'TMA-6',
  'Tabernanthe iboga (botany)',
  'Tapentadol',
  'Temazepam',
  'Theacrine',
  'Theanine',
  'Thebaine',
  'Thienodiazepines',
  'Tianeptine',
  'Tramadol',
  'Tryptamine (compound)',
  'Tyrosine',
  'U-47700',
  'Xanthines',
  'Zolpidem',
  'Zopiclone',
  'Beta-Carboline',
  '??MT',
  '??k-2C-B',
];
