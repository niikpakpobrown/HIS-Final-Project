--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Postgres.app)
-- Dumped by pg_dump version 17.0

-- Started on 2025-04-16 11:38:06 EDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16511)
-- Name: diagnosis; Type: TABLE; Schema: public; Owner: dadb
--

CREATE TABLE public.diagnosis (
    visit_id character varying(5) NOT NULL,
    alzheimers_diagnosis character varying(10)
);


ALTER TABLE public.diagnosis OWNER TO dadb;

--
-- TOC entry 221 (class 1259 OID 16501)
-- Name: lifestyle; Type: TABLE; Schema: public; Owner: dadb
--

CREATE TABLE public.lifestyle (
    visit_id character varying(5) NOT NULL,
    physical_activity_level character varying(50),
    smoking_status character varying(50),
    alcohol_consumption character varying(50),
    depression_level character varying(50),
    sleep_quality character varying(50),
    dietary_habits character varying(50),
    air_pollution_exposure character varying(50),
    social_engagement_level character varying(50),
    stress_levels character varying(50)
);


ALTER TABLE public.lifestyle OWNER TO dadb;

--
-- TOC entry 217 (class 1259 OID 16471)
-- Name: patient; Type: TABLE; Schema: public; Owner: dadb
--

CREATE TABLE public.patient (
    patient_id character varying(5) NOT NULL,
    age integer,
    gender character varying(10),
    education_level integer,
    employment_status character varying(50),
    marital_status character varying(50),
    income_level character varying(50),
    urban_vs_rural_living character varying(20),
    family_history character varying(10),
    genetic_risk_factor character varying(10),
    physician_id character varying(3)
);


ALTER TABLE public.patient OWNER TO dadb;

--
-- TOC entry 220 (class 1259 OID 16491)
-- Name: patienttest; Type: TABLE; Schema: public; Owner: dadb
--

CREATE TABLE public.patienttest (
    visit_id character varying(5) NOT NULL,
    bmi double precision,
    diabetes character varying(10),
    hypertension character varying(10),
    cholesterol_level character varying(50),
    cognitive_test_score integer
);


ALTER TABLE public.patienttest OWNER TO dadb;

--
-- TOC entry 218 (class 1259 OID 16476)
-- Name: physician; Type: TABLE; Schema: public; Owner: dadb
--

CREATE TABLE public.physician (
    physician_id character varying(3) NOT NULL,
    physician_name character varying(100),
    password character varying(50)
);


ALTER TABLE public.physician OWNER TO dadb;

--
-- TOC entry 219 (class 1259 OID 16481)
-- Name: visit; Type: TABLE; Schema: public; Owner: dadb
--

CREATE TABLE public.visit (
    visit_id character varying(5) NOT NULL,
    patient_id character varying(5),
    visit_date date
);


ALTER TABLE public.visit OWNER TO dadb;

--
-- TOC entry 3703 (class 0 OID 16511)
-- Dependencies: 222
-- Data for Name: diagnosis; Type: TABLE DATA; Schema: public; Owner: dadb
--

COPY public.diagnosis (visit_id, alzheimers_diagnosis) FROM stdin;
V0001	No
V0002	No
V0003	Yes
V0004	Yes
V0005	No
V0006	No
V0007	No
V0008	No
V0009	Yes
V0010	No
V0011	No
V0012	Yes
V0013	No
V0014	Yes
V0015	No
V0016	No
V0017	Yes
V0018	No
V0019	No
V0020	Yes
V0021	No
V0022	No
V0023	No
V0024	No
V0025	No
V0026	No
V0027	Yes
V0028	No
V0029	Yes
V0030	Yes
V0031	Yes
V0032	No
V0033	No
V0034	No
V0035	Yes
V0036	Yes
V0037	Yes
V0038	Yes
V0039	No
V0040	Yes
V0041	No
V0042	No
V0043	Yes
V0044	Yes
V0045	No
V0046	No
V0047	Yes
V0048	Yes
V0049	Yes
V0050	No
V0051	No
V0052	Yes
V0053	No
V0054	No
V0055	Yes
V0056	No
V0057	Yes
V0058	No
V0059	Yes
V0060	Yes
V0061	Yes
V0062	No
V0063	No
V0064	No
V0065	No
V0066	Yes
V0067	No
V0068	Yes
V0069	Yes
V0070	Yes
V0071	Yes
V0072	No
V0073	No
V0074	No
V0075	No
V0076	Yes
V0077	No
V0078	No
V0079	No
V0080	No
V0081	No
V0082	No
V0083	No
V0084	No
V0085	Yes
V0086	No
V0087	Yes
V0088	No
V0089	Yes
V0090	No
V0091	Yes
V0092	No
V0093	Yes
V0094	Yes
V0095	Yes
V0096	Yes
V0097	Yes
V0098	No
V0099	No
V0100	No
V0101	Yes
V0102	No
V0103	Yes
V0104	Yes
V0105	No
V0106	No
V0107	No
V0108	Yes
V0109	No
V0110	No
V0111	Yes
V0112	No
V0113	No
V0114	No
V0115	No
V0116	Yes
V0117	No
V0118	No
V0119	No
V0120	No
V0121	Yes
V0122	Yes
V0123	No
V0124	Yes
V0125	No
V0126	No
V0127	Yes
V0128	No
V0129	No
V0130	No
V0131	No
V0132	Yes
V0133	No
V0134	Yes
V0135	Yes
V0136	No
V0137	No
V0138	No
V0139	No
V0140	Yes
V0141	No
V0142	Yes
V0143	Yes
V0144	No
V0145	Yes
V0146	No
V0147	Yes
V0148	No
V0149	No
V0150	Yes
V0151	No
V0152	No
V0153	No
V0154	No
V0155	Yes
V0156	No
V0157	Yes
V0158	No
V0159	Yes
V0160	Yes
V0161	No
V0162	No
V0163	Yes
V0164	No
V0165	Yes
V0166	No
V0167	No
V0168	Yes
V0169	No
V0170	No
V0171	No
V0172	Yes
V0173	No
V0174	Yes
V0175	Yes
V0176	No
V0177	Yes
V0178	No
V0179	No
V0180	No
V0181	No
V0182	No
V0183	Yes
V0184	No
V0185	No
V0186	No
V0187	No
V0188	No
V0189	Yes
V0190	No
V0191	No
V0192	No
V0193	Yes
V0194	No
V0195	No
V0196	Yes
V0197	No
V0198	No
V0199	Yes
V0200	Yes
V0201	Yes
V0202	No
V0203	Yes
V0204	No
V0205	No
V0206	Yes
V0207	Yes
V0208	No
V0209	No
V0210	No
V0211	No
V0212	No
V0213	Yes
V0214	No
V0215	Yes
V0216	Yes
V0217	Yes
V0218	No
V0219	Yes
V0220	No
V0221	No
V0222	Yes
V0223	No
V0224	No
V0225	No
V0226	Yes
V0227	No
V0228	Yes
V0229	Yes
V0230	No
V0231	No
V0232	No
V0233	Yes
V0234	No
V0235	Yes
V0236	No
V0237	Yes
V0238	Yes
V0239	No
V0240	No
V0241	No
V0242	Yes
V0243	Yes
V0244	Yes
V0245	No
V0246	Yes
V0247	No
V0248	No
V0249	No
V0250	No
V0251	No
V0252	No
V0253	Yes
V0254	No
V0255	No
V0256	Yes
V0257	No
V0258	No
V0259	Yes
V0260	No
V0261	No
V0262	No
V0263	No
V0264	Yes
V0265	No
V0266	No
V0267	Yes
V0268	Yes
V0269	No
V0270	No
V0271	No
V0272	No
V0273	Yes
V0274	No
V0275	No
V0276	Yes
V0277	Yes
V0278	No
V0279	No
V0280	No
V0281	Yes
V0282	No
V0283	No
V0284	Yes
V0285	Yes
V0286	No
V0287	Yes
V0288	Yes
V0289	No
V0290	No
V0291	No
V0292	Yes
V0293	No
V0294	Yes
V0295	No
V0296	No
V0297	No
V0298	No
V0299	No
V0300	No
V0301	Yes
V0302	No
V0303	Yes
V0304	Yes
V0305	No
V0306	No
V0307	Yes
V0308	No
V0309	No
V0310	No
V0311	Yes
V0312	No
V0313	Yes
V0314	No
V0315	No
V0316	Yes
V0317	No
V0318	No
V0319	No
V0320	No
V0321	No
V0322	No
V0323	No
V0324	No
V0325	No
V0326	No
V0327	Yes
V0328	No
V0329	No
V0330	No
V0331	Yes
V0332	No
V0333	Yes
V0334	Yes
V0335	No
V0336	No
V0337	Yes
V0338	Yes
V0339	No
V0340	No
V0341	Yes
V0342	No
V0343	Yes
V0344	Yes
V0345	Yes
V0346	Yes
V0347	Yes
V0348	No
V0349	No
V0350	No
V0351	Yes
V0352	No
V0353	No
V0354	No
V0355	No
V0356	No
V0357	No
V0358	No
V0359	No
V0360	No
V0361	No
V0362	No
V0363	No
V0364	Yes
V0365	No
V0366	No
V0367	Yes
V0368	Yes
V0369	No
V0370	No
V0371	No
V0372	No
V0373	Yes
V0374	No
V0375	Yes
V0376	Yes
V0377	No
V0378	Yes
V0379	Yes
V0380	No
V0381	Yes
V0382	No
V0383	No
V0384	Yes
V0385	No
V0386	No
V0387	No
V0388	Yes
V0389	Yes
V0390	No
V0391	No
V0392	No
V0393	No
V0394	Yes
V0395	Yes
V0396	No
V0397	No
V0398	No
V0399	No
V0400	No
V0401	No
V0402	Yes
V0403	Yes
V0404	Yes
V0405	Yes
V0406	Yes
V0407	No
V0408	Yes
V0409	Yes
V0410	Yes
V0411	No
V0412	No
V0413	Yes
V0414	No
V0415	No
V0416	No
V0417	No
V0418	Yes
V0419	No
V0420	Yes
V0421	Yes
V0422	Yes
V0423	No
V0424	Yes
V0425	Yes
V0426	No
V0427	Yes
V0428	No
V0429	Yes
V0430	Yes
V0431	No
V0432	No
V0433	No
V0434	Yes
V0435	No
V0436	Yes
V0437	No
V0438	No
V0439	Yes
V0440	No
V0441	No
V0442	No
V0443	Yes
V0444	No
V0445	No
V0446	No
V0447	No
V0448	No
V0449	No
V0450	No
V0451	Yes
V0452	Yes
V0453	Yes
V0454	No
V0455	No
V0456	Yes
V0457	Yes
V0458	No
V0459	Yes
V0460	Yes
V0461	Yes
V0462	No
V0463	No
V0464	No
V0465	No
V0466	Yes
V0467	No
V0468	Yes
V0469	No
V0470	No
V0471	Yes
V0472	No
V0473	Yes
V0474	No
V0475	Yes
V0476	Yes
V0477	Yes
V0478	Yes
V0479	Yes
V0480	Yes
V0481	No
V0482	No
V0483	Yes
V0484	No
V0485	Yes
V0486	No
V0487	Yes
V0488	Yes
V0489	Yes
V0490	No
V0491	No
V0492	No
V0493	Yes
V0494	No
V0495	No
V0496	No
V0497	No
V0498	Yes
V0499	No
V0500	No
V0501	No
V0502	Yes
V0503	Yes
V0504	Yes
V0505	No
V0506	No
V0507	Yes
V0508	No
V0509	No
V0510	No
V0511	Yes
V0512	No
V0513	No
V0514	No
V0515	Yes
V0516	No
V0517	No
V0518	Yes
V0519	No
V0520	Yes
V0521	No
V0522	No
V0523	No
V0524	Yes
V0525	No
V0526	No
V0527	No
V0528	Yes
V0529	Yes
V0530	Yes
V0531	No
V0532	No
V0533	Yes
V0534	Yes
V0535	No
V0536	No
V0537	No
V0538	Yes
V0539	No
V0540	No
V0541	Yes
V0542	Yes
V0543	No
V0544	No
V0545	No
V0546	Yes
V0547	Yes
V0548	Yes
V0549	No
V0550	No
V0551	No
V0552	No
V0553	No
V0554	No
V0555	Yes
V0556	No
V0557	No
V0558	No
V0559	No
V0560	No
V0561	Yes
V0562	No
V0563	Yes
V0564	Yes
V0565	No
V0566	No
V0567	No
V0568	No
V0569	Yes
V0570	No
V0571	Yes
V0572	No
V0573	No
V0574	No
V0575	No
V0576	Yes
V0577	No
V0578	No
V0579	No
V0580	Yes
V0581	Yes
V0582	No
V0583	Yes
V0584	Yes
V0585	No
V0586	No
V0587	Yes
V0588	Yes
V0589	No
V0590	No
V0591	No
V0592	No
V0593	No
V0594	No
V0595	No
V0596	Yes
V0597	No
V0598	No
V0599	Yes
V0600	No
V0601	No
V0602	No
V0603	No
V0604	No
V0605	Yes
V0606	No
V0607	No
V0608	Yes
V0609	Yes
V0610	Yes
V0611	Yes
V0612	Yes
V0613	No
V0614	Yes
V0615	No
V0616	Yes
V0617	No
V0618	No
V0619	No
V0620	No
V0621	No
V0622	Yes
V0623	Yes
V0624	Yes
V0625	Yes
V0626	No
V0627	Yes
V0628	Yes
V0629	Yes
V0630	No
V0631	Yes
V0632	No
V0633	No
V0634	No
V0635	No
V0636	No
V0637	Yes
V0638	No
V0639	No
V0640	No
V0641	No
V0642	No
V0643	No
V0644	Yes
V0645	Yes
V0646	No
V0647	Yes
V0648	No
V0649	Yes
V0650	Yes
V0651	No
V0652	No
V0653	No
V0654	Yes
V0655	No
V0656	No
V0657	No
V0658	Yes
V0659	No
V0660	No
V0661	Yes
V0662	No
V0663	No
V0664	Yes
V0665	Yes
V0666	No
V0667	Yes
V0668	No
V0669	No
V0670	Yes
V0671	No
V0672	No
V0673	Yes
V0674	No
V0675	No
V0676	Yes
V0677	Yes
V0678	No
V0679	Yes
V0680	Yes
V0681	Yes
V0682	No
V0683	No
V0684	No
V0685	Yes
V0686	Yes
V0687	No
V0688	Yes
V0689	Yes
V0690	Yes
V0691	No
V0692	No
V0693	No
V0694	No
V0695	No
V0696	No
V0697	Yes
V0698	Yes
V0699	Yes
V0700	No
V0701	Yes
V0702	No
V0703	Yes
V0704	No
V0705	Yes
V0706	No
V0707	Yes
V0708	Yes
V0709	Yes
V0710	Yes
V0711	Yes
V0712	No
V0713	No
V0714	No
V0715	Yes
V0716	Yes
V0717	No
V0718	No
V0719	Yes
V0720	No
V0721	No
V0722	Yes
V0723	No
V0724	No
V0725	Yes
V0726	No
V0727	No
V0728	No
V0729	Yes
V0730	No
V0731	Yes
V0732	Yes
V0733	No
V0734	No
V0735	Yes
V0736	No
V0737	No
V0738	Yes
V0739	Yes
V0740	Yes
V0741	No
V0742	No
V0743	Yes
V0744	No
V0745	No
V0746	No
V0747	Yes
V0748	No
V0749	Yes
V0750	Yes
V0751	No
V0752	No
V0753	Yes
V0754	Yes
V0755	Yes
V0756	No
V0757	No
V0758	No
V0759	No
V0760	No
V0761	No
V0762	Yes
V0763	No
V0764	Yes
V0765	No
V0766	No
V0767	No
V0768	No
V0769	Yes
V0770	No
V0771	No
V0772	No
V0773	No
V0774	No
V0775	No
V0776	No
V0777	No
V0778	No
V0779	Yes
V0780	No
V0781	Yes
V0782	Yes
V0783	Yes
V0784	No
V0785	No
V0786	No
V0787	No
V0788	Yes
V0789	Yes
V0790	No
V0791	Yes
V0792	No
V0793	No
V0794	Yes
V0795	No
V0796	No
V0797	No
V0798	No
V0799	No
V0800	No
V0801	Yes
V0802	No
V0803	No
V0804	No
V0805	No
V0806	No
V0807	No
V0808	Yes
V0809	No
V0810	Yes
V0811	No
V0812	Yes
V0813	Yes
V0814	Yes
V0815	No
V0816	No
V0817	Yes
V0818	No
V0819	No
V0820	No
V0821	No
V0822	No
V0823	Yes
V0824	No
V0825	Yes
V0826	Yes
V0827	No
V0828	Yes
V0829	Yes
V0830	Yes
V0831	No
V0832	No
V0833	No
V0834	Yes
V0835	No
V0836	No
V0837	Yes
V0838	Yes
V0839	Yes
V0840	Yes
V0841	Yes
V0842	No
V0843	No
V0844	No
V0845	Yes
V0846	No
V0847	Yes
V0848	No
V0849	Yes
V0850	No
V0851	Yes
V0852	No
V0853	No
V0854	Yes
V0855	No
V0856	Yes
V0857	No
V0858	Yes
V0859	No
V0860	Yes
V0861	No
V0862	No
V0863	No
V0864	No
V0865	No
V0866	No
V0867	Yes
V0868	No
V0869	No
V0870	Yes
V0871	No
V0872	No
V0873	No
V0874	Yes
V0875	Yes
V0876	No
V0877	No
V0878	Yes
V0879	No
V0880	No
V0881	Yes
V0882	No
V0883	Yes
V0884	No
V0885	No
V0886	No
V0887	Yes
V0888	No
V0889	Yes
V0890	No
V0891	No
V0892	Yes
V0893	No
V0894	No
V0895	Yes
V0896	No
V0897	Yes
V0898	Yes
V0899	Yes
V0900	No
V0901	No
V0902	Yes
V0903	Yes
V0904	No
V0905	Yes
V0906	Yes
V0907	No
V0908	No
V0909	No
V0910	No
V0911	No
V0912	No
V0913	Yes
V0914	No
V0915	Yes
V0916	No
V0917	Yes
V0918	Yes
V0919	Yes
V0920	No
V0921	No
V0922	No
V0923	No
V0924	Yes
V0925	No
V0926	Yes
V0927	No
V0928	No
V0929	No
V0930	Yes
V0931	No
V0932	No
V0933	Yes
V0934	Yes
V0935	No
V0936	No
V0937	Yes
V0938	No
V0939	Yes
V0940	No
V0941	No
V0942	Yes
V0943	No
V0944	Yes
V0945	No
V0946	No
V0947	Yes
V0948	No
V0949	No
V0950	Yes
V0951	Yes
V0952	No
V0953	Yes
V0954	Yes
V0955	Yes
V0956	No
V0957	Yes
V0958	Yes
V0959	Yes
V0960	No
V0961	Yes
V0962	No
V0963	No
V0964	No
V0965	No
V0966	Yes
V0967	No
V0968	Yes
V0969	No
V0970	No
V0971	No
V0972	Yes
V0973	No
V0974	No
V0975	Yes
V0976	Yes
V0977	No
V0978	Yes
V0979	No
V0980	No
V0981	No
V0982	No
V0983	No
V0984	No
V0985	No
V0986	No
V0987	No
V0988	No
V0989	No
V0990	No
V0991	No
V0992	No
V0993	No
V0994	Yes
V0995	No
V0996	No
V0997	No
V0998	Yes
V0999	No
V1000	No
\.


--
-- TOC entry 3702 (class 0 OID 16501)
-- Dependencies: 221
-- Data for Name: lifestyle; Type: TABLE DATA; Schema: public; Owner: dadb
--

COPY public.lifestyle (visit_id, physical_activity_level, smoking_status, alcohol_consumption, depression_level, sleep_quality, dietary_habits, air_pollution_exposure, social_engagement_level, stress_levels) FROM stdin;
V0001	Medium	Current	Regularly	Medium	Average	Unhealthy	High	Low	High
V0002	Medium	Never	Regularly	Low	Poor	Healthy	High	Medium	Low
V0003	Medium	Former	Occasionally	Low	Poor	Healthy	High	Low	Medium
V0004	Low	Current	Occasionally	Low	Average	Average	Medium	Low	High
V0005	Medium	Current	Never	Low	Poor	Unhealthy	Low	Low	Low
V0006	Low	Never	Never	High	Good	Unhealthy	High	High	High
V0007	Medium	Current	Regularly	Low	Average	Healthy	Medium	Medium	Medium
V0008	Low	Current	Never	Medium	Good	Average	High	Medium	High
V0009	High	Former	Never	Low	Average	Unhealthy	Low	Low	Medium
V0010	High	Former	Never	Medium	Good	Healthy	Low	High	High
V0011	High	Current	Never	High	Poor	Unhealthy	Medium	Low	Low
V0012	High	Former	Occasionally	Medium	Average	Healthy	Medium	Low	Low
V0013	Medium	Never	Regularly	High	Good	Unhealthy	Low	Medium	High
V0014	Medium	Current	Never	Low	Good	Unhealthy	Medium	High	Medium
V0015	Low	Never	Never	Medium	Good	Unhealthy	High	Low	Low
V0016	Low	Never	Never	Low	Poor	Healthy	Medium	Low	High
V0017	Low	Never	Regularly	Medium	Poor	Healthy	Low	Medium	High
V0018	Medium	Former	Regularly	High	Average	Unhealthy	Medium	Low	Low
V0019	High	Former	Occasionally	Medium	Good	Average	Low	Low	High
V0020	High	Never	Occasionally	Low	Good	Unhealthy	Medium	Low	Medium
V0021	High	Former	Occasionally	Low	Good	Unhealthy	High	High	Low
V0022	Low	Former	Never	High	Average	Average	Low	Medium	High
V0023	High	Former	Never	Low	Good	Unhealthy	Medium	Medium	Low
V0024	Low	Never	Occasionally	High	Poor	Average	Low	Medium	Low
V0025	Low	Former	Never	High	Average	Average	Medium	Low	Low
V0026	Medium	Never	Regularly	Low	Average	Average	Low	High	High
V0027	High	Never	Occasionally	High	Poor	Unhealthy	Medium	Medium	High
V0028	High	Never	Regularly	Medium	Average	Unhealthy	Low	Low	Medium
V0029	Low	Never	Regularly	High	Poor	Average	High	High	Medium
V0030	High	Former	Regularly	High	Good	Unhealthy	Low	Medium	Low
V0031	Medium	Current	Never	High	Average	Average	Low	Medium	Low
V0032	Medium	Current	Regularly	High	Poor	Unhealthy	High	Low	High
V0033	Low	Never	Occasionally	Low	Poor	Average	High	High	Medium
V0034	High	Never	Never	Low	Poor	Average	High	Medium	Medium
V0035	Low	Former	Never	Medium	Poor	Healthy	High	High	Medium
V0036	Medium	Current	Occasionally	Medium	Good	Unhealthy	Low	Low	High
V0037	High	Never	Occasionally	Medium	Good	Unhealthy	Medium	Medium	Medium
V0038	Medium	Former	Occasionally	High	Average	Average	High	Medium	High
V0039	Low	Current	Regularly	Low	Good	Unhealthy	High	High	Low
V0040	High	Current	Never	High	Good	Unhealthy	Low	Low	High
V0041	Medium	Current	Never	High	Good	Unhealthy	High	Low	Low
V0042	Low	Never	Occasionally	Medium	Good	Healthy	Medium	High	Low
V0043	High	Never	Never	High	Poor	Healthy	Low	Medium	High
V0044	High	Current	Never	Low	Good	Unhealthy	Low	Low	High
V0045	Medium	Never	Never	Low	Average	Unhealthy	High	Low	Medium
V0046	Low	Current	Never	Low	Good	Unhealthy	High	High	Medium
V0047	High	Current	Never	Low	Poor	Unhealthy	Medium	High	High
V0048	Low	Current	Never	Low	Good	Unhealthy	Low	Medium	Medium
V0049	High	Former	Occasionally	High	Poor	Average	Low	High	High
V0050	Medium	Current	Occasionally	Low	Poor	Healthy	High	Medium	Medium
V0051	Medium	Former	Occasionally	Medium	Average	Average	High	Low	High
V0052	Medium	Never	Regularly	High	Poor	Average	Low	High	High
V0053	Low	Former	Never	High	Average	Healthy	High	Low	Medium
V0054	High	Former	Regularly	Medium	Good	Unhealthy	High	High	High
V0055	Medium	Former	Never	High	Average	Unhealthy	Medium	Medium	Low
V0056	Low	Never	Regularly	High	Good	Average	Low	Medium	Low
V0057	High	Former	Never	Low	Average	Healthy	High	High	Medium
V0058	Medium	Never	Occasionally	Low	Good	Healthy	High	High	Medium
V0059	High	Former	Never	Low	Good	Healthy	High	Low	High
V0060	Low	Never	Regularly	Low	Average	Healthy	High	Low	Medium
V0061	Low	Former	Occasionally	Medium	Good	Average	Low	Medium	High
V0062	Low	Former	Never	High	Poor	Average	Medium	High	High
V0063	High	Never	Regularly	Medium	Average	Average	Low	High	High
V0064	Low	Current	Occasionally	Low	Poor	Unhealthy	High	High	Medium
V0065	Medium	Former	Never	Medium	Good	Average	Low	Low	Medium
V0066	Low	Former	Never	Medium	Good	Average	Medium	Medium	Low
V0067	High	Former	Never	High	Good	Unhealthy	Low	Low	High
V0068	Low	Never	Never	Low	Good	Unhealthy	Low	Low	Low
V0069	High	Current	Occasionally	Medium	Poor	Healthy	High	Medium	Medium
V0070	Low	Current	Occasionally	High	Good	Average	Low	Low	High
V0071	Medium	Former	Never	Medium	Average	Average	High	High	Low
V0072	Low	Current	Never	Low	Poor	Healthy	Low	High	Medium
V0073	Medium	Former	Regularly	Low	Good	Average	High	High	High
V0074	Low	Former	Never	Medium	Average	Unhealthy	Low	Low	High
V0075	High	Current	Regularly	High	Good	Average	High	High	Low
V0076	High	Never	Never	Medium	Poor	Average	Medium	Low	High
V0077	Low	Never	Regularly	Low	Poor	Unhealthy	High	High	High
V0078	Medium	Former	Never	Medium	Average	Average	High	High	Low
V0079	Medium	Former	Never	Low	Good	Healthy	Medium	High	Medium
V0080	Low	Former	Occasionally	Medium	Good	Average	High	Medium	Medium
V0081	Medium	Never	Occasionally	Low	Poor	Healthy	High	High	Medium
V0082	Low	Former	Never	Low	Poor	Average	Low	Low	Low
V0083	Low	Former	Never	Medium	Good	Healthy	Medium	Medium	Medium
V0084	Medium	Never	Regularly	Medium	Good	Healthy	High	High	Medium
V0085	Low	Former	Regularly	Low	Average	Healthy	Medium	Medium	Medium
V0086	Medium	Former	Occasionally	Medium	Average	Average	Medium	Low	Medium
V0087	High	Current	Occasionally	Low	Average	Average	Low	High	High
V0088	High	Current	Occasionally	Medium	Poor	Healthy	Low	Medium	High
V0089	Low	Current	Regularly	Low	Good	Average	High	Low	High
V0090	Medium	Former	Regularly	High	Poor	Average	High	High	High
V0091	Medium	Never	Never	High	Good	Unhealthy	Medium	High	High
V0092	High	Current	Regularly	High	Good	Healthy	Low	Low	Low
V0093	High	Never	Regularly	High	Average	Average	High	Medium	Low
V0094	Medium	Current	Never	Low	Good	Unhealthy	Medium	Low	High
V0095	Low	Current	Occasionally	High	Average	Average	High	Low	Medium
V0096	Low	Current	Occasionally	Medium	Average	Average	Medium	High	High
V0097	High	Never	Occasionally	High	Good	Average	Medium	Low	Low
V0098	High	Current	Never	Medium	Average	Unhealthy	High	Medium	Low
V0099	High	Current	Occasionally	High	Poor	Healthy	High	Low	Medium
V0100	Low	Former	Regularly	Low	Good	Unhealthy	High	Medium	Low
V0101	High	Never	Occasionally	Low	Poor	Healthy	Medium	Medium	Medium
V0102	Low	Never	Occasionally	High	Poor	Healthy	High	Low	Low
V0103	Low	Never	Occasionally	Low	Good	Average	Medium	Low	Medium
V0104	Medium	Former	Never	High	Average	Healthy	Medium	Medium	Medium
V0105	Low	Former	Occasionally	Medium	Good	Healthy	Medium	Medium	Low
V0106	Low	Former	Occasionally	High	Poor	Average	Medium	Medium	Low
V0107	Medium	Former	Never	High	Poor	Healthy	High	High	High
V0108	Low	Former	Regularly	Low	Poor	Average	Low	Low	Medium
V0109	Low	Former	Occasionally	Medium	Poor	Average	Medium	High	High
V0110	High	Former	Regularly	Medium	Good	Unhealthy	High	Medium	Low
V0111	Medium	Current	Regularly	Medium	Good	Healthy	Low	Low	High
V0112	Low	Current	Occasionally	Medium	Average	Unhealthy	Low	Low	Low
V0113	Medium	Former	Never	High	Poor	Unhealthy	High	Low	Medium
V0114	High	Current	Never	Medium	Poor	Average	Medium	High	Medium
V0115	Medium	Never	Regularly	Low	Poor	Healthy	Low	Medium	Low
V0116	Low	Current	Never	Medium	Poor	Healthy	High	High	Low
V0117	Low	Never	Regularly	High	Average	Unhealthy	High	Medium	High
V0118	Low	Never	Regularly	High	Good	Unhealthy	High	Medium	High
V0119	High	Current	Regularly	Medium	Average	Unhealthy	High	High	High
V0120	Low	Current	Never	High	Poor	Healthy	High	Medium	Medium
V0121	High	Current	Regularly	Low	Average	Healthy	Low	High	Low
V0122	Low	Former	Never	Low	Good	Unhealthy	Medium	Low	High
V0123	Medium	Former	Occasionally	High	Poor	Unhealthy	Medium	Medium	Low
V0124	High	Former	Regularly	Medium	Poor	Average	Medium	High	High
V0125	Medium	Former	Occasionally	Low	Good	Unhealthy	Medium	High	Low
V0126	High	Never	Never	Medium	Average	Average	Low	Medium	High
V0127	Low	Current	Never	High	Average	Unhealthy	Medium	Medium	Medium
V0128	High	Current	Regularly	High	Average	Healthy	High	High	Medium
V0129	Low	Former	Never	Medium	Poor	Average	High	Low	Low
V0130	Medium	Never	Regularly	High	Good	Healthy	Medium	Medium	Medium
V0131	Low	Former	Occasionally	Low	Poor	Average	High	Medium	Medium
V0132	Medium	Never	Occasionally	Low	Good	Average	Low	Low	Medium
V0133	Medium	Former	Regularly	Low	Good	Unhealthy	High	Medium	Medium
V0134	Low	Former	Occasionally	Low	Good	Unhealthy	High	Low	High
V0135	High	Current	Regularly	High	Good	Unhealthy	High	High	Low
V0136	Medium	Current	Never	High	Good	Unhealthy	High	High	High
V0137	Low	Current	Never	Medium	Good	Unhealthy	High	Low	Medium
V0138	Low	Former	Never	Medium	Average	Unhealthy	High	Medium	High
V0139	Medium	Current	Occasionally	Medium	Good	Unhealthy	Medium	High	Low
V0140	High	Former	Never	Low	Poor	Average	Medium	High	Low
V0141	Low	Never	Regularly	Low	Poor	Healthy	High	Medium	High
V0142	Low	Never	Regularly	Low	Average	Healthy	Low	Medium	Low
V0143	Low	Never	Occasionally	Medium	Average	Average	Medium	Medium	High
V0144	Medium	Never	Regularly	Medium	Good	Unhealthy	Medium	Low	High
V0145	High	Current	Regularly	Low	Good	Unhealthy	Low	High	Medium
V0146	Medium	Never	Never	Low	Good	Average	Medium	High	Low
V0147	Medium	Never	Never	Medium	Average	Healthy	Low	High	Low
V0148	High	Current	Regularly	High	Good	Average	Low	Low	Medium
V0149	High	Never	Regularly	Low	Average	Healthy	High	Medium	Medium
V0150	High	Former	Never	High	Average	Healthy	Medium	Medium	Low
V0151	Medium	Former	Never	High	Good	Healthy	Medium	Low	High
V0152	Low	Current	Regularly	Low	Good	Average	Medium	Medium	High
V0153	Medium	Never	Regularly	Low	Good	Healthy	Low	High	Low
V0154	Medium	Current	Never	High	Poor	Unhealthy	High	High	Medium
V0155	Medium	Never	Regularly	Medium	Poor	Average	Medium	High	Low
V0156	Low	Current	Regularly	High	Good	Average	Medium	Low	High
V0157	Low	Never	Occasionally	High	Poor	Average	High	Low	Low
V0158	Low	Current	Occasionally	Low	Poor	Unhealthy	Low	Low	Low
V0159	Low	Former	Regularly	High	Poor	Average	High	Low	Medium
V0160	High	Never	Regularly	High	Poor	Healthy	Medium	Low	Low
V0161	Low	Current	Never	Medium	Good	Healthy	Medium	Low	Medium
V0162	Medium	Current	Regularly	High	Poor	Average	Medium	Medium	High
V0163	High	Never	Occasionally	High	Poor	Unhealthy	Low	High	High
V0164	High	Current	Regularly	Medium	Poor	Healthy	Low	Low	High
V0165	High	Never	Regularly	Medium	Good	Average	Medium	Low	High
V0166	Medium	Current	Occasionally	Low	Poor	Unhealthy	Low	High	Medium
V0167	Medium	Current	Occasionally	Low	Average	Healthy	Low	High	High
V0168	High	Never	Regularly	Low	Good	Healthy	High	Low	High
V0169	High	Former	Regularly	Medium	Good	Unhealthy	Low	Low	High
V0170	High	Never	Regularly	Medium	Good	Healthy	Medium	High	Low
V0171	Medium	Never	Regularly	Low	Average	Unhealthy	Low	High	High
V0172	Low	Former	Never	Medium	Average	Unhealthy	Medium	Medium	Low
V0173	Medium	Former	Occasionally	Medium	Good	Average	Medium	Low	High
V0174	High	Former	Regularly	Medium	Good	Unhealthy	High	High	High
V0175	Low	Never	Never	Low	Good	Unhealthy	High	High	High
V0176	Low	Current	Occasionally	Medium	Average	Healthy	Medium	High	Medium
V0177	High	Current	Regularly	High	Good	Unhealthy	Medium	Low	Low
V0178	Low	Current	Regularly	High	Good	Healthy	High	Low	Medium
V0179	High	Former	Regularly	High	Average	Average	Medium	Low	High
V0180	Medium	Current	Regularly	Medium	Poor	Unhealthy	Low	Medium	Medium
V0181	Low	Former	Occasionally	High	Good	Healthy	Low	High	Medium
V0182	Medium	Current	Regularly	High	Poor	Healthy	Low	Low	Medium
V0183	Low	Never	Never	Medium	Average	Average	High	Medium	Low
V0184	High	Never	Occasionally	Medium	Good	Average	Low	Medium	Low
V0185	Medium	Current	Occasionally	Low	Average	Average	Low	Low	Medium
V0186	High	Current	Occasionally	Low	Good	Average	High	High	Low
V0187	High	Former	Never	Medium	Good	Healthy	Medium	High	Medium
V0188	Medium	Former	Regularly	High	Good	Average	High	Medium	Medium
V0189	High	Former	Never	Low	Average	Healthy	Low	High	Low
V0190	Medium	Current	Regularly	High	Good	Unhealthy	Medium	Medium	Medium
V0191	Low	Never	Occasionally	Medium	Good	Healthy	Medium	High	Low
V0192	Low	Never	Never	Low	Poor	Average	High	Medium	High
V0193	High	Current	Regularly	Medium	Average	Unhealthy	High	Medium	Low
V0194	Medium	Former	Regularly	High	Good	Unhealthy	Medium	Low	Low
V0195	Low	Former	Never	High	Average	Average	Low	High	Low
V0196	High	Never	Occasionally	Low	Good	Average	High	High	Medium
V0197	Medium	Former	Regularly	Medium	Good	Healthy	High	High	High
V0198	Medium	Current	Regularly	Medium	Poor	Average	High	High	Medium
V0199	Medium	Former	Occasionally	Low	Good	Healthy	Low	High	High
V0200	Medium	Never	Never	Medium	Good	Unhealthy	Low	High	Medium
V0201	Medium	Never	Occasionally	High	Poor	Healthy	Medium	High	Low
V0202	High	Former	Regularly	Low	Good	Unhealthy	Medium	Low	Medium
V0203	High	Current	Regularly	Low	Good	Unhealthy	Low	High	High
V0204	Low	Never	Never	Low	Good	Unhealthy	Low	Low	Low
V0205	Medium	Former	Occasionally	High	Good	Unhealthy	Medium	High	Low
V0206	High	Former	Regularly	Low	Average	Unhealthy	Low	Low	Medium
V0207	Low	Never	Occasionally	Low	Average	Unhealthy	Medium	Low	Low
V0208	Low	Former	Occasionally	Medium	Poor	Average	Low	High	Medium
V0209	High	Current	Regularly	High	Average	Unhealthy	Low	High	High
V0210	Medium	Never	Never	Low	Good	Unhealthy	Low	Medium	High
V0211	Medium	Never	Regularly	High	Poor	Healthy	Medium	High	Medium
V0212	Medium	Former	Regularly	High	Good	Average	Low	High	High
V0213	Medium	Current	Regularly	Low	Good	Average	Low	Low	Low
V0214	High	Current	Regularly	High	Average	Healthy	Low	High	Medium
V0215	Medium	Never	Occasionally	High	Poor	Healthy	Low	High	Medium
V0216	Low	Never	Occasionally	Medium	Average	Unhealthy	Medium	High	Medium
V0217	High	Former	Never	Low	Poor	Healthy	Medium	High	Low
V0218	High	Former	Occasionally	Medium	Good	Average	High	High	Low
V0219	Low	Former	Occasionally	Medium	Average	Healthy	High	High	Low
V0220	High	Current	Occasionally	High	Average	Average	High	Low	Medium
V0221	Medium	Former	Never	Medium	Poor	Unhealthy	Medium	High	Medium
V0222	High	Current	Never	Low	Average	Healthy	Medium	Medium	High
V0223	Low	Current	Regularly	High	Poor	Healthy	High	High	Medium
V0224	Low	Former	Never	Medium	Poor	Unhealthy	Low	High	High
V0225	Medium	Former	Occasionally	High	Poor	Unhealthy	Medium	Medium	Low
V0226	Low	Former	Regularly	High	Good	Healthy	Medium	Medium	Medium
V0227	High	Current	Never	High	Good	Average	Medium	Low	Low
V0228	High	Former	Never	Low	Average	Unhealthy	Low	High	High
V0229	High	Never	Regularly	Medium	Average	Unhealthy	Low	Low	Medium
V0230	Low	Former	Never	Medium	Good	Healthy	High	Low	Medium
V0231	Medium	Current	Occasionally	High	Average	Unhealthy	Low	High	Low
V0232	Medium	Never	Never	High	Average	Healthy	Low	High	Medium
V0233	Medium	Current	Occasionally	Medium	Average	Healthy	Low	Medium	High
V0234	Medium	Current	Never	High	Good	Healthy	Low	Medium	High
V0235	Medium	Never	Occasionally	High	Average	Unhealthy	Low	Medium	Medium
V0236	Low	Former	Occasionally	High	Average	Healthy	Low	High	Low
V0237	High	Current	Occasionally	Low	Poor	Average	Low	High	Low
V0238	Low	Former	Occasionally	Medium	Average	Healthy	Medium	High	Low
V0239	Medium	Never	Occasionally	High	Good	Unhealthy	Medium	Medium	Medium
V0240	Low	Former	Regularly	High	Poor	Unhealthy	High	High	Low
V0241	Medium	Current	Never	High	Poor	Unhealthy	High	High	High
V0242	Medium	Former	Regularly	Medium	Average	Average	Low	Low	High
V0243	High	Former	Occasionally	High	Good	Average	Low	Low	High
V0244	Low	Never	Regularly	Medium	Poor	Healthy	Low	Medium	High
V0245	High	Current	Never	Low	Poor	Healthy	Low	Low	Medium
V0246	High	Never	Regularly	High	Average	Average	High	Medium	High
V0247	Medium	Never	Occasionally	High	Poor	Healthy	Medium	Medium	High
V0248	Low	Current	Occasionally	Medium	Average	Unhealthy	Medium	Medium	Low
V0249	High	Current	Never	Medium	Average	Unhealthy	High	Medium	Low
V0250	Medium	Former	Regularly	Low	Good	Unhealthy	Medium	Medium	Low
V0251	High	Former	Regularly	High	Good	Average	Low	Low	High
V0252	Medium	Former	Never	Low	Poor	Healthy	Low	High	Low
V0253	Low	Current	Regularly	Low	Good	Unhealthy	High	Medium	Medium
V0254	High	Never	Never	High	Average	Healthy	Low	High	Low
V0255	Medium	Never	Never	Medium	Poor	Healthy	Low	Low	Low
V0256	High	Never	Never	Medium	Good	Healthy	High	High	High
V0257	Medium	Never	Regularly	High	Good	Average	Low	High	High
V0258	Low	Never	Never	Low	Poor	Unhealthy	Medium	Medium	Medium
V0259	High	Former	Occasionally	Medium	Good	Average	Medium	Medium	High
V0260	Medium	Never	Regularly	Medium	Good	Average	Low	Low	Low
V0261	Medium	Former	Never	Low	Average	Unhealthy	High	High	Medium
V0262	Low	Current	Never	Low	Poor	Unhealthy	High	Low	High
V0263	High	Former	Regularly	Low	Good	Unhealthy	High	High	Low
V0264	Medium	Former	Occasionally	High	Poor	Average	Medium	Low	Low
V0265	Medium	Former	Never	High	Poor	Unhealthy	High	Medium	Medium
V0266	Low	Current	Never	Medium	Poor	Average	High	Low	Medium
V0267	High	Former	Never	Medium	Average	Average	Low	Low	High
V0268	High	Current	Regularly	Low	Poor	Average	Low	Low	Low
V0269	High	Former	Occasionally	Medium	Poor	Unhealthy	High	Low	Medium
V0270	High	Never	Occasionally	Low	Good	Healthy	High	Low	High
V0271	Low	Current	Occasionally	Low	Good	Unhealthy	Medium	Low	Low
V0272	Low	Current	Never	Low	Poor	Healthy	Low	Medium	High
V0273	Medium	Never	Regularly	High	Average	Average	High	Medium	High
V0274	High	Never	Occasionally	Medium	Good	Healthy	Medium	Medium	Medium
V0275	High	Never	Occasionally	High	Average	Average	Low	Medium	Medium
V0276	Medium	Former	Regularly	High	Average	Healthy	High	Medium	Low
V0277	High	Never	Never	Low	Poor	Unhealthy	Low	Low	Medium
V0278	Low	Current	Never	High	Poor	Healthy	High	Medium	Medium
V0279	Low	Current	Regularly	High	Average	Average	Low	Medium	Low
V0280	Low	Former	Never	Medium	Average	Average	Medium	Medium	High
V0281	High	Former	Occasionally	Low	Average	Healthy	High	Medium	Low
V0282	Medium	Never	Occasionally	High	Good	Unhealthy	Medium	High	Medium
V0283	Medium	Former	Occasionally	Low	Good	Healthy	High	Low	Medium
V0284	Low	Current	Regularly	Medium	Good	Unhealthy	Medium	High	Low
V0285	High	Current	Regularly	Low	Average	Unhealthy	High	Medium	Medium
V0286	Low	Never	Regularly	High	Poor	Unhealthy	High	Low	Low
V0287	Low	Never	Occasionally	Medium	Poor	Unhealthy	Medium	Low	Low
V0288	Medium	Former	Regularly	High	Poor	Healthy	High	High	High
V0289	Medium	Current	Occasionally	Low	Poor	Healthy	High	Low	Medium
V0290	Low	Never	Occasionally	Low	Average	Healthy	Low	Medium	Low
V0291	Medium	Never	Regularly	High	Good	Unhealthy	Medium	Low	Low
V0292	Medium	Current	Never	High	Poor	Average	Medium	Low	Medium
V0293	Medium	Former	Never	High	Average	Healthy	Low	Low	High
V0294	High	Never	Never	High	Poor	Healthy	Medium	Medium	Low
V0295	Low	Current	Occasionally	High	Average	Average	Medium	High	High
V0296	Low	Never	Occasionally	Low	Good	Average	Medium	High	Medium
V0297	Medium	Former	Regularly	Low	Average	Healthy	Low	Low	Low
V0298	Low	Former	Occasionally	Medium	Average	Average	High	Medium	Medium
V0299	High	Former	Regularly	Medium	Poor	Average	Low	High	Medium
V0300	Low	Never	Regularly	Low	Good	Healthy	Low	Low	High
V0301	Medium	Never	Occasionally	Low	Good	Healthy	Medium	Medium	Medium
V0302	High	Never	Regularly	Medium	Average	Healthy	High	High	Low
V0303	Low	Never	Occasionally	Low	Poor	Unhealthy	Medium	High	Low
V0304	High	Former	Never	Medium	Poor	Healthy	Low	Low	High
V0305	High	Current	Never	Low	Good	Healthy	High	High	Low
V0306	Medium	Current	Never	Medium	Poor	Unhealthy	Medium	Low	High
V0307	Low	Former	Occasionally	Medium	Poor	Healthy	High	High	High
V0308	Low	Former	Regularly	High	Average	Average	Low	Medium	Low
V0309	High	Former	Never	Low	Good	Average	Low	High	High
V0310	Medium	Former	Regularly	Medium	Poor	Healthy	Medium	Low	High
V0311	Medium	Current	Occasionally	Medium	Good	Average	Medium	Medium	Low
V0312	High	Former	Regularly	High	Good	Average	Low	Medium	High
V0313	Medium	Former	Never	Medium	Average	Healthy	Medium	Medium	Low
V0314	High	Former	Occasionally	High	Average	Healthy	Medium	Low	High
V0315	Low	Current	Occasionally	Medium	Poor	Healthy	High	Medium	High
V0316	Medium	Former	Regularly	Medium	Good	Healthy	Medium	Low	Low
V0317	High	Former	Regularly	High	Poor	Unhealthy	Medium	Medium	High
V0318	Low	Former	Regularly	High	Poor	Average	Low	Low	Medium
V0319	Low	Current	Occasionally	Medium	Poor	Average	Low	Low	Medium
V0320	High	Never	Regularly	Low	Good	Unhealthy	Low	Medium	High
V0321	High	Former	Regularly	Medium	Poor	Unhealthy	High	Low	High
V0322	Medium	Current	Occasionally	Low	Poor	Healthy	Low	High	Medium
V0323	Medium	Never	Regularly	Low	Good	Unhealthy	High	High	Low
V0324	High	Current	Never	Low	Average	Healthy	High	Medium	High
V0325	Medium	Current	Never	High	Good	Unhealthy	High	Medium	Low
V0326	Low	Never	Regularly	Medium	Good	Average	Medium	Low	High
V0327	Low	Current	Regularly	Medium	Good	Average	Low	High	High
V0328	Medium	Former	Never	Low	Poor	Unhealthy	High	Low	Medium
V0329	Low	Former	Regularly	High	Good	Healthy	Medium	Low	High
V0330	Medium	Current	Occasionally	Medium	Good	Healthy	High	Low	Low
V0331	High	Never	Never	High	Good	Healthy	Medium	Low	Low
V0332	High	Current	Regularly	High	Poor	Healthy	Medium	High	Low
V0333	High	Never	Occasionally	High	Poor	Unhealthy	High	Medium	High
V0334	Low	Former	Never	Low	Good	Healthy	Medium	Low	High
V0335	Low	Current	Occasionally	Medium	Good	Average	High	Medium	Medium
V0336	Medium	Former	Never	Medium	Good	Average	High	High	Low
V0337	Medium	Never	Never	High	Average	Average	Low	Medium	Low
V0338	Medium	Never	Occasionally	Medium	Good	Unhealthy	Low	Low	Low
V0339	Medium	Former	Regularly	High	Poor	Unhealthy	Medium	Medium	High
V0340	Medium	Former	Regularly	High	Good	Average	Medium	High	Low
V0341	Medium	Never	Never	High	Average	Unhealthy	Medium	Medium	Low
V0342	Low	Former	Never	High	Poor	Average	Medium	Medium	Medium
V0343	Low	Never	Occasionally	Medium	Poor	Healthy	Low	Medium	Medium
V0344	High	Never	Regularly	High	Good	Healthy	Medium	Medium	High
V0345	High	Current	Occasionally	Low	Average	Healthy	Medium	Low	High
V0346	High	Former	Regularly	Medium	Good	Healthy	Medium	High	High
V0347	High	Former	Regularly	Low	Good	Average	High	Medium	Medium
V0348	High	Current	Occasionally	Low	Good	Unhealthy	High	High	Low
V0349	Low	Current	Occasionally	Low	Average	Unhealthy	Low	High	High
V0350	High	Former	Occasionally	Low	Good	Unhealthy	High	Low	High
V0351	Medium	Current	Never	High	Poor	Average	Low	High	High
V0352	Low	Never	Regularly	High	Good	Unhealthy	Low	Medium	Low
V0353	Medium	Current	Regularly	Low	Average	Healthy	Medium	High	Low
V0354	Medium	Current	Regularly	High	Poor	Healthy	Low	Medium	High
V0355	Medium	Current	Occasionally	Medium	Good	Average	Medium	Medium	Low
V0356	Medium	Former	Occasionally	High	Average	Healthy	High	High	Medium
V0357	Medium	Current	Never	High	Poor	Average	Low	Medium	Low
V0358	Medium	Current	Regularly	Low	Good	Unhealthy	Low	High	High
V0359	Medium	Never	Regularly	High	Average	Average	Low	High	Medium
V0360	Low	Never	Regularly	High	Good	Healthy	Medium	High	Medium
V0361	Low	Former	Occasionally	Medium	Average	Average	Medium	High	Medium
V0362	Low	Former	Never	Low	Average	Unhealthy	High	High	High
V0363	Medium	Current	Regularly	High	Poor	Average	Low	Low	High
V0364	High	Former	Never	Low	Poor	Healthy	High	Low	Medium
V0365	High	Former	Regularly	Medium	Good	Average	Medium	Low	Low
V0366	Medium	Former	Occasionally	Low	Average	Unhealthy	Low	High	Medium
V0367	High	Never	Occasionally	High	Average	Healthy	Medium	High	Low
V0368	Low	Current	Never	High	Poor	Unhealthy	High	Low	High
V0369	High	Former	Never	High	Average	Unhealthy	High	High	Low
V0370	High	Former	Never	High	Average	Average	Low	Medium	Medium
V0371	Medium	Current	Never	Low	Good	Healthy	High	High	Low
V0372	Low	Former	Occasionally	High	Average	Unhealthy	Low	High	Low
V0373	High	Former	Never	Low	Poor	Unhealthy	Low	Low	Medium
V0374	High	Former	Never	Low	Good	Healthy	High	High	Medium
V0375	High	Never	Occasionally	Medium	Good	Average	Medium	Low	Low
V0376	Low	Never	Never	Low	Poor	Average	High	Medium	Low
V0377	High	Never	Never	High	Poor	Average	High	Low	Medium
V0378	Medium	Never	Regularly	Low	Average	Unhealthy	Low	Low	Medium
V0379	High	Former	Occasionally	Low	Good	Unhealthy	Low	High	Medium
V0380	Low	Former	Regularly	High	Average	Healthy	Medium	High	Low
V0381	Medium	Never	Regularly	Low	Average	Average	High	High	High
V0382	Low	Current	Occasionally	Low	Poor	Unhealthy	Low	Low	Low
V0383	Low	Never	Occasionally	High	Poor	Average	High	High	Medium
V0384	Low	Current	Occasionally	Medium	Good	Unhealthy	High	Low	High
V0385	Low	Current	Regularly	High	Poor	Healthy	Medium	Low	Medium
V0386	Medium	Current	Regularly	Low	Poor	Healthy	Medium	High	Low
V0387	High	Former	Never	Medium	Average	Unhealthy	Low	Low	Low
V0388	Low	Never	Regularly	Low	Poor	Average	Medium	Medium	High
V0389	High	Never	Occasionally	High	Poor	Average	Low	Medium	High
V0390	High	Former	Never	Medium	Good	Unhealthy	High	Low	High
V0391	Low	Current	Regularly	High	Average	Healthy	High	Low	High
V0392	Low	Current	Never	High	Average	Unhealthy	Low	Low	Low
V0393	Medium	Current	Never	High	Good	Unhealthy	Medium	High	Medium
V0394	High	Current	Never	High	Average	Unhealthy	Low	Medium	Low
V0395	High	Never	Occasionally	High	Average	Healthy	Low	High	High
V0396	Medium	Current	Occasionally	High	Average	Unhealthy	Medium	Medium	High
V0397	Low	Current	Never	Low	Average	Healthy	Low	Medium	Medium
V0398	Low	Former	Occasionally	Medium	Good	Average	Medium	High	Low
V0399	High	Former	Occasionally	Low	Average	Average	Low	Low	Medium
V0400	Low	Never	Occasionally	Low	Good	Unhealthy	Low	High	Low
V0401	Medium	Current	Occasionally	High	Good	Average	High	High	Medium
V0402	Medium	Current	Occasionally	Low	Good	Unhealthy	Low	Low	Low
V0403	Medium	Never	Regularly	Low	Poor	Average	Medium	Medium	Low
V0404	Low	Current	Regularly	High	Poor	Healthy	Medium	Medium	Low
V0405	Low	Current	Never	Medium	Poor	Healthy	Medium	High	High
V0406	Low	Never	Never	High	Good	Healthy	Medium	Medium	Medium
V0407	Medium	Never	Never	Medium	Good	Unhealthy	Medium	Low	High
V0408	Medium	Current	Never	High	Average	Average	Low	Low	Low
V0409	High	Former	Regularly	High	Average	Unhealthy	High	High	High
V0410	High	Former	Never	High	Poor	Healthy	High	High	High
V0411	Low	Never	Regularly	High	Good	Unhealthy	Medium	High	Medium
V0412	Low	Never	Occasionally	High	Good	Average	Low	High	Medium
V0413	Medium	Former	Occasionally	Low	Poor	Unhealthy	Medium	Low	Low
V0414	High	Former	Never	Medium	Poor	Healthy	Medium	Low	Medium
V0415	High	Current	Occasionally	High	Poor	Healthy	Low	Medium	High
V0416	Low	Former	Never	High	Good	Average	Low	Low	Medium
V0417	Low	Current	Occasionally	High	Average	Healthy	Medium	Medium	Low
V0418	High	Former	Never	High	Good	Unhealthy	Low	High	Low
V0419	Medium	Former	Never	High	Average	Unhealthy	Low	Low	Medium
V0420	High	Former	Regularly	Low	Good	Healthy	Low	Medium	Medium
V0421	Medium	Current	Occasionally	High	Average	Unhealthy	Medium	Medium	Medium
V0422	High	Former	Never	Medium	Average	Average	High	High	Medium
V0423	Medium	Never	Regularly	Low	Poor	Healthy	Medium	High	Medium
V0424	High	Never	Occasionally	High	Average	Healthy	Medium	High	Medium
V0425	Low	Current	Never	Medium	Poor	Average	Medium	Medium	Low
V0426	Low	Former	Occasionally	High	Poor	Healthy	Low	High	Medium
V0427	Medium	Current	Occasionally	Medium	Poor	Unhealthy	Low	Medium	High
V0428	High	Current	Regularly	High	Average	Healthy	Medium	High	Low
V0429	Low	Current	Never	Low	Poor	Unhealthy	High	Low	Low
V0430	High	Former	Never	High	Average	Healthy	Low	Low	High
V0431	Low	Current	Never	High	Good	Average	Medium	Medium	Low
V0432	Low	Current	Occasionally	Medium	Good	Average	Medium	Medium	High
V0433	High	Never	Occasionally	Low	Average	Healthy	High	Medium	Low
V0434	Low	Current	Occasionally	Low	Average	Healthy	Low	High	High
V0435	Medium	Former	Regularly	Low	Good	Average	Medium	Medium	High
V0436	Medium	Never	Regularly	High	Average	Average	Medium	Medium	High
V0437	Low	Current	Never	Medium	Good	Healthy	High	High	Low
V0438	Low	Current	Regularly	High	Average	Average	Medium	Medium	High
V0439	Medium	Current	Occasionally	Low	Poor	Unhealthy	Medium	High	Medium
V0440	Low	Former	Regularly	Low	Good	Average	High	Low	High
V0441	High	Never	Regularly	Low	Average	Unhealthy	Medium	Low	Medium
V0442	Medium	Former	Occasionally	High	Poor	Average	Low	High	Medium
V0443	Medium	Never	Never	Medium	Poor	Healthy	Low	High	High
V0444	High	Former	Regularly	Medium	Average	Unhealthy	Low	Medium	High
V0445	High	Former	Occasionally	High	Average	Healthy	Medium	Medium	Low
V0446	Medium	Former	Occasionally	High	Good	Unhealthy	Medium	High	Low
V0447	High	Never	Regularly	Medium	Good	Average	Medium	Medium	Low
V0448	Medium	Never	Never	Medium	Good	Healthy	Medium	Medium	Low
V0449	High	Never	Occasionally	Medium	Poor	Average	Low	Low	Low
V0450	High	Former	Never	Low	Average	Average	High	Medium	Low
V0451	Medium	Current	Never	High	Poor	Unhealthy	High	Low	Low
V0452	Low	Current	Occasionally	High	Good	Average	High	Medium	Low
V0453	Medium	Former	Never	Medium	Good	Unhealthy	High	Low	Medium
V0454	Medium	Current	Never	Low	Poor	Unhealthy	High	High	High
V0455	High	Former	Occasionally	High	Poor	Unhealthy	Medium	Low	High
V0456	High	Never	Occasionally	Low	Average	Average	Medium	Low	Low
V0457	Low	Former	Regularly	High	Poor	Unhealthy	High	Medium	Low
V0458	High	Current	Never	Medium	Good	Average	Medium	Low	High
V0459	Medium	Former	Occasionally	Low	Average	Unhealthy	Medium	High	High
V0460	Medium	Former	Never	Low	Average	Average	Medium	High	Medium
V0461	Low	Former	Regularly	Medium	Average	Average	Medium	Low	Medium
V0462	High	Current	Occasionally	Low	Good	Unhealthy	Low	Medium	Low
V0463	Medium	Never	Regularly	Medium	Good	Average	Medium	Medium	High
V0464	Medium	Never	Regularly	High	Good	Healthy	High	Low	Low
V0465	Medium	Former	Never	Low	Good	Unhealthy	High	Medium	Low
V0466	Medium	Former	Regularly	Low	Average	Average	Low	Low	Low
V0467	Medium	Never	Never	High	Poor	Unhealthy	Medium	Low	Low
V0468	Low	Former	Occasionally	Medium	Poor	Unhealthy	Medium	Low	High
V0469	Medium	Current	Occasionally	Medium	Good	Healthy	Low	High	Low
V0470	Medium	Current	Occasionally	Low	Poor	Unhealthy	Medium	High	High
V0471	High	Current	Never	Medium	Poor	Average	High	Medium	High
V0472	High	Current	Never	Low	Average	Average	Low	Low	Low
V0473	High	Former	Never	Medium	Poor	Average	Low	Medium	High
V0474	Medium	Former	Never	Low	Good	Average	Medium	Medium	Medium
V0475	Medium	Former	Never	Low	Poor	Average	Low	Low	Low
V0476	High	Former	Regularly	Low	Poor	Healthy	Medium	Medium	High
V0477	Low	Current	Regularly	High	Average	Average	Low	Low	High
V0478	High	Never	Occasionally	Low	Average	Healthy	Low	Medium	Low
V0479	Medium	Former	Regularly	Medium	Poor	Unhealthy	Medium	High	High
V0480	Medium	Former	Never	High	Average	Unhealthy	Medium	Low	Medium
V0481	High	Current	Occasionally	High	Good	Healthy	High	Low	High
V0482	Medium	Former	Occasionally	Low	Poor	Average	Low	Medium	Low
V0483	Medium	Current	Regularly	Low	Average	Average	Low	Low	Medium
V0484	High	Former	Occasionally	Low	Poor	Healthy	High	Low	High
V0485	Low	Former	Never	Medium	Poor	Unhealthy	Medium	High	Low
V0486	Medium	Current	Occasionally	Low	Poor	Unhealthy	High	High	Medium
V0487	Medium	Never	Regularly	Medium	Average	Healthy	Medium	Medium	Medium
V0488	Medium	Former	Occasionally	Low	Good	Unhealthy	High	Low	Medium
V0489	Low	Current	Occasionally	Medium	Good	Unhealthy	Medium	High	High
V0490	High	Current	Regularly	Low	Average	Unhealthy	Medium	Medium	High
V0491	Medium	Current	Occasionally	Medium	Poor	Unhealthy	Low	High	Low
V0492	High	Current	Occasionally	High	Poor	Average	Low	High	Low
V0493	High	Former	Never	Medium	Good	Unhealthy	Low	Medium	Medium
V0494	Medium	Never	Occasionally	Medium	Poor	Unhealthy	Low	Medium	Low
V0495	Medium	Current	Never	Medium	Poor	Healthy	High	Low	Medium
V0496	High	Current	Regularly	High	Poor	Average	High	High	Low
V0497	Low	Current	Occasionally	High	Poor	Unhealthy	High	High	Medium
V0498	High	Never	Regularly	Medium	Good	Unhealthy	High	Low	Low
V0499	Medium	Current	Occasionally	Medium	Good	Unhealthy	High	Low	High
V0500	High	Never	Occasionally	Low	Average	Healthy	High	Low	Medium
V0501	High	Current	Regularly	High	Poor	Average	High	Medium	Low
V0502	Low	Former	Regularly	Low	Poor	Average	Low	Medium	Medium
V0503	Low	Current	Occasionally	Low	Average	Healthy	High	Low	Medium
V0504	Low	Never	Occasionally	High	Good	Unhealthy	High	Medium	Low
V0505	Medium	Former	Regularly	Medium	Good	Unhealthy	Medium	High	Medium
V0506	High	Never	Regularly	Low	Good	Healthy	Medium	Low	High
V0507	Low	Never	Never	High	Average	Unhealthy	Medium	Low	High
V0508	Low	Former	Regularly	Low	Average	Average	Medium	High	Medium
V0509	High	Current	Never	Medium	Average	Average	High	High	Low
V0510	Medium	Current	Never	Medium	Good	Average	High	Medium	Medium
V0511	Low	Current	Never	High	Poor	Unhealthy	Low	Low	High
V0512	High	Never	Never	High	Good	Average	Low	Low	High
V0513	High	Former	Regularly	High	Poor	Unhealthy	High	Low	High
V0514	Low	Never	Never	Low	Poor	Healthy	High	High	High
V0515	High	Never	Regularly	Medium	Good	Average	Low	High	Low
V0516	Medium	Never	Regularly	Low	Average	Average	High	Low	Medium
V0517	Low	Former	Never	High	Average	Average	Low	Low	High
V0518	High	Never	Never	High	Poor	Unhealthy	Medium	Medium	Medium
V0519	High	Never	Regularly	Medium	Poor	Healthy	Low	High	High
V0520	Medium	Current	Never	High	Poor	Unhealthy	Medium	High	Medium
V0521	High	Never	Never	Low	Poor	Unhealthy	High	Medium	Medium
V0522	High	Never	Regularly	Medium	Good	Healthy	High	Low	High
V0523	Medium	Never	Never	High	Poor	Unhealthy	Medium	Low	High
V0524	Low	Current	Never	High	Average	Average	Low	Low	Low
V0525	Medium	Never	Never	Low	Average	Average	High	Medium	Medium
V0526	Medium	Former	Occasionally	Medium	Average	Unhealthy	High	High	Low
V0527	Medium	Never	Occasionally	High	Good	Unhealthy	Low	Medium	Low
V0528	Low	Former	Regularly	Medium	Poor	Average	Low	High	High
V0529	Low	Current	Occasionally	Medium	Good	Unhealthy	Low	High	Medium
V0530	Medium	Never	Regularly	High	Poor	Healthy	High	Medium	Low
V0531	Medium	Current	Never	High	Good	Average	Medium	High	High
V0532	High	Current	Occasionally	Medium	Average	Healthy	High	Medium	Medium
V0533	Medium	Current	Never	Low	Good	Healthy	High	High	High
V0534	High	Former	Never	Medium	Good	Unhealthy	Low	High	High
V0535	High	Current	Never	High	Average	Unhealthy	Low	Low	Low
V0536	Medium	Current	Occasionally	Medium	Average	Average	Low	Medium	Medium
V0537	Medium	Current	Regularly	Low	Good	Healthy	Medium	High	High
V0538	High	Current	Regularly	High	Average	Healthy	Low	Low	High
V0539	High	Never	Regularly	Low	Poor	Unhealthy	High	Medium	Medium
V0540	High	Never	Occasionally	Low	Good	Unhealthy	Medium	High	Low
V0541	Medium	Current	Occasionally	High	Average	Average	High	Low	Medium
V0542	Low	Current	Regularly	Medium	Good	Average	High	High	Medium
V0543	High	Current	Regularly	High	Average	Average	High	High	High
V0544	Medium	Never	Occasionally	Medium	Poor	Unhealthy	Low	Low	Medium
V0545	Low	Never	Regularly	Medium	Good	Unhealthy	Medium	High	Medium
V0546	Medium	Former	Regularly	High	Good	Unhealthy	Medium	High	Medium
V0547	Medium	Never	Regularly	Low	Poor	Unhealthy	High	Low	High
V0548	Medium	Never	Occasionally	High	Poor	Average	Low	Medium	High
V0549	High	Current	Occasionally	Medium	Average	Average	Medium	High	Medium
V0550	High	Never	Never	Medium	Poor	Unhealthy	Medium	High	Medium
V0551	High	Former	Never	Low	Average	Average	Medium	Low	High
V0552	High	Current	Never	Medium	Average	Average	Medium	High	High
V0553	High	Never	Regularly	Low	Poor	Average	High	High	High
V0554	Medium	Former	Occasionally	Medium	Good	Unhealthy	High	Medium	Low
V0555	Low	Former	Never	Low	Poor	Unhealthy	Low	Low	Medium
V0556	Medium	Never	Occasionally	High	Poor	Average	High	High	Medium
V0557	Low	Current	Occasionally	Medium	Poor	Healthy	Low	Medium	High
V0558	Low	Current	Never	Medium	Average	Unhealthy	High	High	Low
V0559	Low	Never	Regularly	High	Poor	Unhealthy	Medium	Medium	Low
V0560	Low	Former	Regularly	Medium	Average	Average	High	High	High
V0561	High	Former	Regularly	Low	Good	Average	Low	Low	Low
V0562	High	Current	Occasionally	High	Average	Unhealthy	Medium	High	Low
V0563	Low	Never	Regularly	Medium	Good	Healthy	High	High	Low
V0564	Medium	Former	Regularly	Low	Average	Unhealthy	High	Medium	High
V0565	Medium	Current	Occasionally	Medium	Good	Unhealthy	High	Medium	Medium
V0566	Medium	Former	Regularly	Medium	Poor	Healthy	High	Medium	High
V0567	Low	Former	Regularly	Low	Average	Healthy	Low	High	Low
V0568	Low	Never	Never	High	Poor	Unhealthy	Medium	Low	Low
V0569	Low	Current	Never	Low	Average	Healthy	Medium	Medium	High
V0570	Low	Former	Never	Medium	Good	Average	Medium	High	Low
V0571	Medium	Never	Occasionally	High	Average	Average	Low	High	Medium
V0572	Medium	Never	Regularly	High	Average	Unhealthy	Low	Low	High
V0573	Medium	Current	Regularly	Low	Average	Unhealthy	Low	Medium	Low
V0574	Low	Current	Occasionally	Medium	Good	Average	Medium	Low	High
V0575	Low	Current	Never	High	Good	Average	High	Low	High
V0576	Medium	Never	Never	Low	Poor	Unhealthy	Low	Low	High
V0577	Medium	Current	Regularly	High	Good	Average	Low	Low	Medium
V0578	High	Current	Regularly	High	Good	Unhealthy	High	High	Low
V0579	High	Former	Occasionally	Low	Average	Average	Medium	High	Low
V0580	High	Current	Occasionally	High	Average	Healthy	Low	High	Low
V0581	Low	Current	Never	High	Good	Healthy	Medium	High	Low
V0582	Low	Never	Never	Medium	Poor	Unhealthy	Low	High	High
V0583	Medium	Current	Regularly	High	Good	Unhealthy	High	Low	Medium
V0584	Medium	Former	Occasionally	Low	Good	Unhealthy	High	Low	Medium
V0585	High	Never	Regularly	High	Average	Unhealthy	Low	High	Medium
V0586	Medium	Former	Never	High	Average	Unhealthy	High	Medium	Medium
V0587	Medium	Never	Occasionally	High	Average	Healthy	Low	High	High
V0588	High	Never	Never	Low	Good	Healthy	Low	Low	High
V0589	Medium	Never	Occasionally	High	Average	Healthy	Medium	High	Medium
V0590	High	Current	Regularly	Low	Good	Healthy	High	High	Low
V0591	Medium	Current	Regularly	Low	Average	Unhealthy	High	High	Low
V0592	High	Former	Never	Low	Average	Average	Low	High	High
V0593	Medium	Never	Never	High	Poor	Unhealthy	Medium	Low	Low
V0594	High	Current	Regularly	Medium	Good	Unhealthy	Medium	Medium	Low
V0595	Low	Former	Regularly	Low	Good	Healthy	Low	Low	Low
V0596	Low	Never	Never	High	Poor	Unhealthy	High	High	Low
V0597	High	Never	Occasionally	Medium	Good	Unhealthy	Medium	Medium	High
V0598	Medium	Former	Regularly	Low	Average	Average	Medium	High	High
V0599	Low	Former	Occasionally	Medium	Poor	Unhealthy	Medium	Medium	Medium
V0600	Low	Current	Never	Medium	Average	Healthy	High	High	Medium
V0601	High	Never	Regularly	Medium	Average	Unhealthy	Medium	Medium	Medium
V0602	Low	Never	Occasionally	Medium	Poor	Average	High	High	Medium
V0603	High	Current	Regularly	Medium	Average	Unhealthy	Low	High	High
V0604	Low	Current	Occasionally	High	Average	Healthy	Low	Low	Medium
V0605	Low	Current	Regularly	High	Good	Average	High	Medium	Medium
V0606	Low	Former	Regularly	Low	Good	Unhealthy	Medium	Medium	Medium
V0607	Medium	Former	Never	Low	Poor	Healthy	High	High	Medium
V0608	Low	Never	Regularly	High	Average	Average	Low	Low	High
V0609	Medium	Current	Never	High	Poor	Unhealthy	Low	Low	Medium
V0610	Medium	Current	Never	Medium	Average	Average	Medium	Low	Low
V0611	High	Current	Regularly	Medium	Good	Healthy	Low	Low	Medium
V0612	Medium	Former	Never	Medium	Poor	Unhealthy	Medium	Low	Low
V0613	Low	Never	Regularly	High	Good	Average	High	Medium	Low
V0614	Medium	Current	Regularly	Low	Poor	Healthy	Medium	Low	Low
V0615	High	Current	Never	High	Good	Unhealthy	Medium	High	High
V0616	Low	Never	Regularly	Medium	Average	Average	Medium	Low	Medium
V0617	High	Never	Occasionally	High	Poor	Unhealthy	Low	Low	High
V0618	Medium	Former	Occasionally	High	Average	Average	High	High	Medium
V0619	Low	Former	Never	Medium	Poor	Average	High	High	High
V0620	High	Former	Occasionally	Medium	Poor	Healthy	Low	Medium	Low
V0621	High	Never	Regularly	Medium	Poor	Healthy	High	Low	High
V0622	Low	Never	Never	Low	Good	Healthy	High	Medium	Medium
V0623	Low	Never	Never	Medium	Average	Unhealthy	High	Medium	High
V0624	Low	Current	Occasionally	Medium	Average	Unhealthy	Medium	Low	Medium
V0625	Low	Never	Occasionally	Medium	Poor	Healthy	Low	High	High
V0626	Low	Never	Regularly	Low	Good	Healthy	High	Low	Low
V0627	Medium	Current	Never	Medium	Good	Healthy	Low	High	Low
V0628	Medium	Never	Never	High	Average	Average	Medium	High	Medium
V0629	Medium	Former	Never	High	Good	Healthy	Low	Low	Medium
V0630	Medium	Never	Occasionally	Medium	Good	Healthy	Low	High	Medium
V0631	Low	Former	Never	Medium	Poor	Average	Medium	Low	High
V0632	Low	Former	Never	High	Poor	Average	High	High	High
V0633	High	Current	Regularly	High	Poor	Unhealthy	Medium	High	Low
V0634	Medium	Current	Never	Low	Good	Average	Medium	Medium	High
V0635	High	Current	Never	Low	Poor	Unhealthy	Low	Low	Low
V0636	Medium	Never	Regularly	High	Poor	Average	Low	High	Low
V0637	Medium	Never	Never	Medium	Average	Unhealthy	High	Low	High
V0638	High	Current	Regularly	Medium	Poor	Unhealthy	High	Medium	Medium
V0639	Low	Never	Regularly	Medium	Average	Healthy	Medium	Low	Low
V0640	Medium	Current	Never	Low	Good	Healthy	Low	Medium	Medium
V0641	High	Never	Never	Medium	Poor	Average	Low	High	Low
V0642	Low	Current	Regularly	Low	Average	Average	High	High	Low
V0643	Low	Current	Regularly	Medium	Average	Unhealthy	Low	Medium	Medium
V0644	High	Current	Regularly	Medium	Good	Average	Medium	Low	Medium
V0645	Medium	Never	Never	Medium	Good	Unhealthy	Low	Low	Medium
V0646	High	Never	Regularly	Medium	Poor	Unhealthy	Low	High	Low
V0647	High	Current	Regularly	Low	Average	Unhealthy	High	Medium	Medium
V0648	Low	Current	Occasionally	Low	Poor	Average	Medium	Medium	High
V0649	High	Current	Regularly	High	Good	Average	Medium	High	High
V0650	Medium	Former	Occasionally	Medium	Average	Average	Low	Medium	Low
V0651	Low	Current	Occasionally	High	Good	Healthy	Low	Low	Medium
V0652	High	Former	Regularly	Low	Average	Average	Low	High	High
V0653	Low	Current	Never	Medium	Good	Average	High	Medium	Low
V0654	High	Former	Regularly	Low	Poor	Healthy	Low	High	High
V0655	High	Current	Regularly	Medium	Poor	Average	Low	Low	Low
V0656	High	Current	Occasionally	Medium	Poor	Average	High	Low	High
V0657	Low	Former	Never	High	Poor	Healthy	Medium	Medium	High
V0658	High	Current	Occasionally	Low	Poor	Average	Low	Medium	Low
V0659	Low	Current	Regularly	High	Poor	Healthy	High	High	Low
V0660	Medium	Never	Regularly	Low	Poor	Average	Medium	Low	Low
V0661	Medium	Never	Never	Medium	Average	Unhealthy	Low	Medium	Low
V0662	Medium	Current	Occasionally	High	Average	Average	Low	Medium	High
V0663	Medium	Current	Never	Medium	Good	Average	Medium	Low	Medium
V0664	Low	Former	Occasionally	High	Good	Unhealthy	High	Low	Medium
V0665	Low	Current	Regularly	Low	Good	Average	High	Medium	Low
V0666	High	Former	Never	High	Poor	Average	High	Medium	Medium
V0667	Low	Current	Regularly	High	Good	Healthy	Medium	High	High
V0668	Medium	Never	Regularly	Low	Good	Healthy	Medium	Low	Low
V0669	Medium	Never	Regularly	High	Poor	Average	Low	High	Medium
V0670	High	Current	Occasionally	High	Good	Average	High	Medium	Low
V0671	Medium	Never	Regularly	Medium	Good	Healthy	Low	Medium	High
V0672	Medium	Current	Regularly	High	Poor	Average	Medium	High	Medium
V0673	Medium	Current	Regularly	Low	Good	Unhealthy	Low	Low	Low
V0674	Low	Current	Occasionally	Medium	Good	Healthy	Low	Low	High
V0675	High	Never	Never	Low	Average	Healthy	High	Medium	High
V0676	High	Never	Regularly	Medium	Good	Average	Low	Medium	Low
V0677	High	Never	Regularly	Low	Average	Healthy	High	Medium	High
V0678	Medium	Current	Regularly	High	Average	Healthy	Medium	High	Medium
V0679	High	Former	Never	Low	Good	Average	High	Medium	Medium
V0680	High	Current	Regularly	High	Average	Unhealthy	Low	Medium	Medium
V0681	Medium	Never	Never	Medium	Average	Average	Low	Medium	Low
V0682	High	Current	Occasionally	Low	Good	Average	High	Medium	Low
V0683	Medium	Former	Regularly	Medium	Poor	Unhealthy	High	Low	High
V0684	Low	Current	Never	Medium	Good	Healthy	Low	Low	Medium
V0685	High	Never	Regularly	Medium	Good	Average	Medium	Low	Low
V0686	Medium	Former	Occasionally	Medium	Average	Healthy	Medium	Low	Medium
V0687	Low	Former	Occasionally	Low	Poor	Unhealthy	Low	Medium	Low
V0688	Medium	Current	Occasionally	High	Good	Healthy	Low	Medium	Medium
V0689	High	Never	Occasionally	Low	Average	Unhealthy	High	High	Low
V0690	Medium	Former	Never	Low	Good	Unhealthy	Medium	High	Medium
V0691	Medium	Current	Never	High	Good	Unhealthy	High	Medium	Low
V0692	High	Current	Occasionally	High	Good	Healthy	Medium	Low	Low
V0693	High	Never	Regularly	High	Good	Average	Low	High	Medium
V0694	High	Former	Regularly	Medium	Average	Average	High	High	Low
V0695	High	Never	Occasionally	High	Good	Unhealthy	Low	High	High
V0696	Low	Never	Occasionally	Medium	Poor	Healthy	Low	Low	High
V0697	Medium	Current	Never	Low	Good	Unhealthy	High	High	High
V0698	Medium	Never	Occasionally	Low	Good	Unhealthy	Low	Medium	Medium
V0699	High	Never	Never	High	Average	Unhealthy	High	Medium	Low
V0700	Low	Never	Regularly	High	Average	Unhealthy	High	Low	Medium
V0701	Low	Current	Never	Medium	Average	Healthy	Medium	Low	High
V0702	Low	Current	Never	High	Good	Unhealthy	Medium	High	High
V0703	Medium	Current	Occasionally	High	Good	Average	Medium	High	High
V0704	Low	Never	Regularly	High	Average	Average	High	Low	High
V0705	Medium	Current	Never	High	Good	Average	High	Low	High
V0706	Medium	Never	Regularly	High	Poor	Healthy	High	Low	Low
V0707	Medium	Never	Never	Medium	Average	Healthy	Low	Low	Medium
V0708	High	Never	Never	High	Poor	Average	High	Medium	High
V0709	Medium	Former	Never	Low	Good	Healthy	Medium	Medium	Medium
V0710	Medium	Current	Occasionally	Medium	Poor	Healthy	Low	Medium	High
V0711	Medium	Never	Never	High	Average	Unhealthy	Low	Low	Low
V0712	High	Never	Regularly	Medium	Good	Healthy	High	Low	Medium
V0713	Medium	Current	Occasionally	Medium	Average	Healthy	Medium	High	Low
V0714	High	Never	Occasionally	High	Poor	Unhealthy	High	High	High
V0715	Medium	Never	Occasionally	High	Poor	Average	Medium	Medium	Low
V0716	Low	Current	Regularly	Medium	Good	Healthy	Low	High	High
V0717	High	Never	Occasionally	Medium	Average	Healthy	Low	Low	Medium
V0718	High	Former	Never	Medium	Good	Average	Low	Low	High
V0719	Low	Current	Never	Medium	Average	Average	Low	Medium	High
V0720	High	Former	Never	Medium	Good	Unhealthy	Low	Low	Medium
V0721	High	Current	Regularly	Medium	Good	Unhealthy	High	Low	Low
V0722	High	Current	Occasionally	High	Average	Healthy	High	Low	Medium
V0723	Low	Never	Occasionally	Medium	Poor	Average	High	High	Low
V0724	Low	Former	Regularly	Medium	Good	Average	Low	Medium	Low
V0725	Low	Former	Never	Medium	Good	Unhealthy	High	Low	Low
V0726	Medium	Current	Never	Low	Good	Healthy	Low	Low	Medium
V0727	Medium	Never	Occasionally	High	Good	Healthy	High	Low	Low
V0728	Low	Never	Never	High	Poor	Healthy	High	High	High
V0729	High	Current	Regularly	Medium	Average	Average	Low	Low	Low
V0730	High	Never	Occasionally	Medium	Average	Unhealthy	Medium	Medium	Low
V0731	Low	Former	Regularly	Low	Good	Healthy	Medium	Medium	Low
V0732	High	Former	Regularly	Medium	Average	Average	Medium	High	High
V0733	High	Former	Occasionally	Medium	Poor	Healthy	Low	Medium	High
V0734	High	Current	Never	High	Good	Healthy	Medium	High	Medium
V0735	High	Current	Regularly	Medium	Poor	Average	Low	High	Medium
V0736	Medium	Never	Occasionally	Low	Good	Healthy	High	Low	Low
V0737	Low	Former	Never	Medium	Poor	Average	Medium	Medium	Low
V0738	High	Never	Never	Medium	Good	Average	Medium	Low	High
V0739	High	Current	Never	Medium	Good	Healthy	Low	High	High
V0740	Medium	Never	Regularly	High	Average	Average	Medium	Low	Low
V0741	High	Former	Occasionally	High	Good	Unhealthy	Low	Low	Low
V0742	Medium	Never	Occasionally	Medium	Average	Healthy	Medium	High	High
V0743	Low	Former	Regularly	Low	Poor	Average	High	Medium	Medium
V0744	Medium	Never	Regularly	High	Poor	Healthy	Medium	Medium	High
V0745	Medium	Never	Never	High	Poor	Average	Medium	High	High
V0746	High	Never	Occasionally	Low	Average	Healthy	Low	Medium	Medium
V0747	Low	Former	Occasionally	Low	Good	Average	Low	High	Low
V0748	Low	Former	Never	Low	Average	Healthy	Medium	Low	Medium
V0749	Low	Never	Never	Low	Average	Average	Medium	Medium	Medium
V0750	Medium	Current	Regularly	Medium	Average	Unhealthy	High	Medium	Low
V0751	Medium	Former	Regularly	Medium	Average	Average	Low	High	Medium
V0752	High	Current	Regularly	Medium	Poor	Average	High	Medium	High
V0753	High	Former	Regularly	Low	Good	Average	Low	Medium	Medium
V0754	High	Never	Occasionally	Low	Poor	Average	Medium	Medium	Low
V0755	Low	Never	Occasionally	High	Good	Unhealthy	Low	Medium	High
V0756	Low	Former	Regularly	Low	Good	Healthy	Low	Low	High
V0757	Medium	Never	Never	High	Average	Unhealthy	Low	Low	Low
V0758	Medium	Never	Occasionally	High	Average	Average	Low	High	High
V0759	Low	Never	Occasionally	Low	Average	Average	Medium	Medium	High
V0760	Low	Current	Never	High	Poor	Healthy	Low	High	Medium
V0761	High	Never	Never	High	Poor	Unhealthy	Medium	Medium	Low
V0762	Low	Former	Never	Medium	Average	Healthy	High	High	Low
V0763	Low	Never	Never	Medium	Poor	Average	Medium	High	Low
V0764	Low	Never	Regularly	High	Good	Unhealthy	Medium	High	High
V0765	Low	Current	Occasionally	Low	Average	Unhealthy	Low	Low	Low
V0766	High	Never	Occasionally	Low	Poor	Unhealthy	Low	Low	Low
V0767	Low	Former	Occasionally	Low	Average	Unhealthy	High	Medium	Medium
V0768	Medium	Current	Never	Medium	Good	Unhealthy	High	Low	Low
V0769	High	Never	Never	Low	Average	Healthy	Medium	Low	Low
V0770	High	Current	Regularly	High	Average	Average	Low	Low	High
V0771	High	Never	Regularly	High	Poor	Unhealthy	High	High	Medium
V0772	Low	Never	Regularly	Low	Average	Average	Low	Low	Low
V0773	Low	Former	Occasionally	Medium	Poor	Unhealthy	Low	Low	High
V0774	High	Former	Occasionally	Medium	Poor	Unhealthy	Medium	High	High
V0775	Medium	Current	Occasionally	Medium	Good	Average	Low	Low	Medium
V0776	Low	Former	Regularly	Medium	Poor	Healthy	Low	Medium	Medium
V0777	High	Former	Occasionally	High	Average	Average	Medium	High	Low
V0778	Low	Former	Regularly	Medium	Poor	Unhealthy	Low	Medium	Low
V0779	High	Former	Never	High	Good	Unhealthy	Medium	High	Medium
V0780	Low	Never	Occasionally	High	Average	Average	Low	High	Medium
V0781	Medium	Former	Regularly	High	Good	Healthy	Medium	Medium	Medium
V0782	Medium	Current	Never	Medium	Good	Healthy	Medium	Medium	High
V0783	High	Never	Occasionally	High	Average	Unhealthy	Low	Medium	Medium
V0784	Low	Current	Never	High	Average	Unhealthy	Low	Medium	High
V0785	Low	Current	Occasionally	High	Good	Healthy	Medium	High	Low
V0786	Medium	Never	Never	Medium	Poor	Unhealthy	High	High	High
V0787	High	Current	Occasionally	Low	Average	Average	High	High	High
V0788	Low	Former	Regularly	Low	Poor	Unhealthy	Low	Low	Low
V0789	High	Never	Never	Low	Poor	Healthy	Medium	Medium	Low
V0790	Medium	Current	Never	Medium	Poor	Average	Medium	High	High
V0791	Low	Former	Occasionally	High	Average	Unhealthy	High	Low	Low
V0792	Medium	Never	Regularly	High	Good	Unhealthy	Medium	High	High
V0793	High	Current	Occasionally	Low	Good	Unhealthy	Medium	High	Low
V0794	High	Never	Never	High	Good	Healthy	Low	Low	Medium
V0795	Low	Former	Occasionally	Medium	Average	Average	Medium	Low	Low
V0796	Medium	Never	Never	High	Poor	Healthy	Medium	Low	Medium
V0797	Low	Former	Never	Medium	Average	Healthy	High	Medium	High
V0798	High	Never	Occasionally	Low	Poor	Unhealthy	Low	High	Medium
V0799	High	Former	Never	High	Good	Unhealthy	Medium	Low	Medium
V0800	Medium	Current	Never	Medium	Poor	Average	Low	High	Low
V0801	High	Former	Occasionally	Low	Average	Healthy	Medium	Medium	High
V0802	Medium	Former	Regularly	Low	Average	Unhealthy	Medium	Medium	Medium
V0803	High	Current	Never	High	Poor	Unhealthy	Low	Medium	Medium
V0804	Medium	Former	Regularly	High	Average	Average	High	Low	Medium
V0805	Low	Former	Occasionally	Medium	Average	Healthy	Medium	Medium	High
V0806	Medium	Former	Never	Low	Poor	Healthy	Medium	Medium	Low
V0807	High	Never	Occasionally	Medium	Good	Average	Medium	High	High
V0808	High	Never	Occasionally	Low	Poor	Unhealthy	Medium	Medium	Low
V0809	Medium	Former	Never	Low	Good	Unhealthy	Medium	High	High
V0810	High	Current	Regularly	Medium	Poor	Unhealthy	Medium	Medium	High
V0811	Low	Current	Occasionally	Low	Poor	Average	Low	Low	High
V0812	Medium	Former	Regularly	Medium	Poor	Healthy	Medium	Medium	Low
V0813	Low	Never	Regularly	Low	Good	Average	Low	Medium	Low
V0814	High	Former	Regularly	High	Average	Average	Medium	High	High
V0815	Medium	Never	Regularly	High	Good	Healthy	Medium	High	Medium
V0816	Low	Current	Occasionally	High	Poor	Unhealthy	Low	Low	High
V0817	Low	Current	Regularly	Low	Average	Unhealthy	Low	High	Low
V0818	High	Never	Never	High	Average	Unhealthy	High	Medium	Medium
V0819	High	Never	Never	High	Poor	Unhealthy	High	High	Medium
V0820	High	Former	Occasionally	Medium	Poor	Healthy	Low	Low	High
V0821	High	Never	Never	Low	Average	Unhealthy	Low	Medium	Medium
V0822	High	Never	Occasionally	High	Average	Unhealthy	High	Low	Low
V0823	Low	Never	Occasionally	Low	Good	Unhealthy	High	Medium	Low
V0824	High	Current	Never	Low	Average	Unhealthy	Low	High	High
V0825	Low	Former	Never	Medium	Good	Unhealthy	Low	High	High
V0826	High	Never	Regularly	Medium	Good	Average	High	Medium	High
V0827	Medium	Never	Never	High	Good	Average	Low	Low	High
V0828	Low	Never	Never	Low	Average	Average	Low	High	Medium
V0829	Low	Former	Regularly	High	Average	Healthy	High	Medium	Medium
V0830	Low	Current	Never	Medium	Good	Average	Medium	Low	Low
V0831	High	Former	Regularly	Medium	Poor	Healthy	High	High	High
V0832	High	Former	Never	Medium	Average	Unhealthy	Low	High	High
V0833	High	Never	Occasionally	Low	Average	Healthy	High	Medium	Medium
V0834	Low	Former	Regularly	Low	Poor	Healthy	Medium	Medium	Medium
V0835	Medium	Former	Occasionally	Low	Poor	Unhealthy	Low	Low	Medium
V0836	High	Never	Never	High	Average	Healthy	Medium	Low	Low
V0837	High	Former	Occasionally	Medium	Poor	Average	Medium	Medium	Low
V0838	High	Current	Regularly	Low	Good	Average	Low	Low	Medium
V0839	High	Never	Never	Medium	Good	Unhealthy	High	Medium	High
V0840	High	Never	Occasionally	Low	Poor	Average	High	Medium	High
V0841	High	Current	Occasionally	High	Good	Average	Low	Low	High
V0842	Medium	Never	Never	Medium	Good	Unhealthy	High	Medium	Low
V0843	High	Former	Regularly	Medium	Good	Healthy	Medium	Medium	High
V0844	High	Never	Never	Low	Average	Average	Low	High	Medium
V0845	Low	Never	Occasionally	High	Good	Healthy	Low	Low	Medium
V0846	High	Current	Never	Low	Poor	Average	Medium	Low	High
V0847	Low	Never	Regularly	Medium	Poor	Average	Medium	Medium	Medium
V0848	Low	Former	Never	Low	Good	Average	High	Medium	Medium
V0849	Low	Former	Regularly	Medium	Poor	Unhealthy	Low	High	Low
V0850	Low	Never	Regularly	High	Poor	Unhealthy	High	Medium	Low
V0851	Low	Former	Occasionally	Low	Poor	Unhealthy	High	Low	Medium
V0852	Medium	Former	Regularly	Medium	Good	Average	Medium	Medium	Medium
V0853	Medium	Never	Regularly	Medium	Average	Average	Medium	Low	High
V0854	Low	Current	Regularly	Low	Poor	Average	Medium	Medium	Low
V0855	Medium	Never	Occasionally	High	Good	Average	High	Medium	Medium
V0856	Low	Former	Regularly	High	Average	Unhealthy	High	High	Medium
V0857	Medium	Never	Occasionally	Medium	Poor	Unhealthy	High	Medium	High
V0858	Low	Former	Occasionally	Low	Poor	Healthy	Low	Medium	Medium
V0859	Medium	Current	Regularly	Low	Good	Unhealthy	Medium	Low	Low
V0860	High	Never	Regularly	High	Poor	Average	Medium	Low	High
V0861	Low	Current	Regularly	Low	Good	Unhealthy	Low	Medium	Medium
V0862	Medium	Current	Never	Low	Poor	Healthy	High	Medium	Low
V0863	Low	Former	Regularly	High	Good	Unhealthy	High	Low	Low
V0864	Medium	Former	Occasionally	Low	Average	Healthy	Medium	Low	Medium
V0865	Medium	Current	Occasionally	Medium	Average	Healthy	High	Low	Low
V0866	Medium	Never	Regularly	Medium	Average	Unhealthy	Medium	Medium	Low
V0867	High	Former	Never	Medium	Average	Unhealthy	High	High	Medium
V0868	Medium	Current	Never	Low	Good	Average	Medium	Low	High
V0869	High	Current	Occasionally	High	Good	Unhealthy	High	Low	Medium
V0870	Low	Current	Never	High	Good	Average	High	Low	High
V0871	Medium	Current	Never	Medium	Good	Healthy	Medium	Low	Low
V0872	Medium	Never	Regularly	Low	Good	Healthy	High	Medium	High
V0873	High	Current	Occasionally	Medium	Poor	Unhealthy	High	High	Medium
V0874	Medium	Former	Occasionally	Low	Good	Unhealthy	Medium	High	High
V0875	Low	Former	Regularly	Low	Average	Average	High	Medium	High
V0876	Low	Current	Never	High	Good	Average	High	Low	Low
V0877	High	Former	Never	High	Good	Healthy	Medium	Low	High
V0878	Low	Current	Occasionally	Medium	Good	Unhealthy	High	Medium	Low
V0879	Medium	Never	Never	Low	Good	Healthy	Low	High	Medium
V0880	High	Never	Regularly	Medium	Average	Average	High	Medium	Low
V0881	Low	Current	Occasionally	Medium	Average	Unhealthy	Medium	Low	Low
V0882	Medium	Current	Regularly	Medium	Good	Unhealthy	Low	Low	Medium
V0883	High	Former	Occasionally	High	Good	Healthy	High	Medium	Low
V0884	High	Never	Regularly	High	Good	Average	Medium	Medium	Medium
V0885	Low	Never	Regularly	Medium	Poor	Average	High	High	Low
V0886	High	Current	Regularly	High	Poor	Average	Low	Medium	Low
V0887	Medium	Former	Occasionally	High	Average	Healthy	High	Medium	Low
V0888	High	Never	Never	High	Good	Unhealthy	Medium	Medium	Medium
V0889	Medium	Former	Never	High	Average	Average	High	Medium	High
V0890	High	Current	Occasionally	Low	Average	Average	High	High	Low
V0891	Low	Never	Regularly	High	Good	Healthy	Low	Low	Medium
V0892	Medium	Former	Occasionally	High	Average	Healthy	Low	Low	Low
V0893	Low	Never	Never	High	Good	Unhealthy	Low	High	High
V0894	Medium	Never	Occasionally	High	Good	Healthy	Medium	Low	High
V0895	High	Former	Never	Medium	Average	Healthy	High	High	Medium
V0896	High	Current	Never	High	Average	Healthy	Low	High	Medium
V0897	Low	Former	Regularly	Medium	Good	Healthy	High	High	High
V0898	Low	Never	Occasionally	High	Good	Healthy	Medium	Medium	Medium
V0899	High	Current	Regularly	Low	Average	Average	Medium	Low	High
V0900	Medium	Former	Regularly	Low	Good	Average	High	Low	Medium
V0901	Low	Former	Never	Low	Poor	Unhealthy	High	High	Medium
V0902	Low	Never	Regularly	High	Average	Average	Medium	High	High
V0903	Low	Current	Occasionally	Medium	Good	Healthy	Medium	Low	High
V0904	Low	Former	Occasionally	Low	Poor	Average	High	High	Medium
V0905	High	Former	Occasionally	High	Average	Healthy	High	High	Low
V0906	High	Former	Never	High	Poor	Healthy	Low	Low	Low
V0907	High	Never	Occasionally	Medium	Poor	Healthy	Medium	Low	Low
V0908	High	Current	Occasionally	Medium	Poor	Average	Low	Low	High
V0909	Medium	Former	Never	Low	Good	Average	High	Medium	Medium
V0910	High	Current	Never	Medium	Good	Healthy	High	Medium	Low
V0911	High	Current	Occasionally	High	Poor	Unhealthy	Medium	High	Low
V0912	High	Current	Never	Medium	Poor	Healthy	Low	High	Medium
V0913	High	Current	Regularly	Medium	Poor	Unhealthy	Low	Low	Medium
V0914	Medium	Former	Never	Low	Poor	Unhealthy	Medium	High	Low
V0915	Low	Current	Occasionally	High	Average	Average	Low	Medium	High
V0916	Medium	Former	Occasionally	Low	Poor	Healthy	Low	High	Medium
V0917	High	Never	Never	Medium	Good	Healthy	Medium	Low	Medium
V0918	High	Former	Never	Low	Good	Healthy	Low	High	Low
V0919	Medium	Never	Occasionally	Low	Good	Unhealthy	Low	Medium	Low
V0920	High	Former	Never	Low	Poor	Unhealthy	Medium	Medium	Low
V0921	Low	Former	Regularly	Medium	Poor	Healthy	Low	High	Medium
V0922	Low	Former	Regularly	Low	Poor	Healthy	Medium	Medium	High
V0923	High	Never	Occasionally	Medium	Poor	Average	Low	Low	High
V0924	Low	Former	Regularly	Low	Average	Average	High	Medium	Medium
V0925	Low	Former	Occasionally	Low	Good	Unhealthy	Low	Medium	Medium
V0926	Low	Former	Never	High	Poor	Unhealthy	High	Medium	Low
V0927	High	Former	Regularly	Low	Poor	Average	Low	High	Low
V0928	Medium	Former	Regularly	Low	Poor	Healthy	Low	Medium	High
V0929	Medium	Former	Regularly	Medium	Good	Average	Low	Low	Medium
V0930	Low	Former	Regularly	Low	Good	Unhealthy	High	High	Low
V0931	High	Current	Never	Low	Poor	Average	Low	Medium	Low
V0932	Low	Former	Occasionally	High	Average	Healthy	Low	High	Low
V0933	Medium	Former	Never	High	Poor	Unhealthy	Medium	Medium	High
V0934	Low	Former	Regularly	Low	Average	Average	Low	High	High
V0935	High	Never	Regularly	Medium	Good	Healthy	Low	High	Low
V0936	High	Never	Occasionally	Medium	Average	Unhealthy	High	Low	Low
V0937	High	Never	Regularly	Low	Poor	Healthy	Low	Medium	Low
V0938	Low	Current	Never	Low	Good	Average	Medium	Medium	Low
V0939	Low	Current	Regularly	High	Poor	Average	High	High	Low
V0940	High	Never	Occasionally	High	Good	Healthy	Medium	High	Medium
V0941	Low	Current	Occasionally	High	Good	Average	High	Low	Medium
V0942	Low	Former	Never	Medium	Average	Healthy	Low	Low	High
V0943	High	Never	Regularly	Medium	Average	Healthy	High	Medium	Medium
V0944	Medium	Former	Regularly	Medium	Good	Average	High	High	Low
V0945	High	Former	Never	Medium	Average	Unhealthy	Medium	Medium	Low
V0946	Low	Never	Regularly	Medium	Good	Average	High	Medium	Low
V0947	Low	Former	Regularly	Medium	Good	Average	Low	Low	High
V0948	Low	Never	Regularly	High	Average	Average	High	High	High
V0949	Medium	Former	Never	Low	Good	Unhealthy	Medium	High	High
V0950	Low	Current	Occasionally	Low	Good	Unhealthy	High	Low	Low
V0951	Medium	Current	Never	Low	Average	Healthy	Medium	Medium	High
V0952	Medium	Former	Occasionally	Medium	Poor	Unhealthy	Medium	High	Medium
V0953	Medium	Never	Occasionally	Medium	Good	Average	Medium	Low	Low
V0954	Medium	Current	Never	Medium	Good	Average	High	Medium	Medium
V0955	High	Former	Never	Low	Poor	Healthy	High	Low	Low
V0956	High	Current	Occasionally	Medium	Average	Healthy	Medium	High	High
V0957	Low	Current	Regularly	High	Good	Unhealthy	Medium	Medium	Low
V0958	Medium	Former	Occasionally	Medium	Poor	Average	High	High	Medium
V0959	Medium	Current	Never	Medium	Average	Unhealthy	Low	Low	Low
V0960	High	Current	Never	Low	Average	Average	High	High	Medium
V0961	Low	Current	Never	Medium	Average	Unhealthy	High	Low	Medium
V0962	Medium	Never	Never	Low	Good	Healthy	Low	High	Medium
V0963	High	Never	Never	Medium	Average	Unhealthy	Low	Low	High
V0964	Low	Former	Occasionally	Medium	Poor	Unhealthy	Low	Low	Medium
V0965	High	Current	Regularly	Medium	Good	Healthy	Medium	Medium	High
V0966	Low	Current	Occasionally	Medium	Average	Unhealthy	Medium	Low	Low
V0967	Low	Current	Regularly	High	Poor	Average	Low	Medium	High
V0968	Low	Never	Regularly	Low	Poor	Unhealthy	High	Low	Low
V0969	Medium	Former	Occasionally	Medium	Average	Unhealthy	High	High	High
V0970	Medium	Former	Never	High	Good	Healthy	Low	High	High
V0971	Low	Current	Never	High	Poor	Unhealthy	Medium	High	Medium
V0972	Medium	Current	Regularly	Low	Average	Average	Low	Low	Low
V0973	Low	Former	Never	Medium	Average	Average	Low	Medium	Medium
V0974	Medium	Current	Occasionally	Low	Good	Healthy	High	Low	Medium
V0975	Medium	Former	Occasionally	High	Average	Unhealthy	Medium	Low	Low
V0976	Low	Current	Regularly	High	Poor	Healthy	Medium	High	High
V0977	Medium	Never	Never	Low	Average	Unhealthy	High	Medium	High
V0978	High	Current	Regularly	Medium	Average	Healthy	High	High	High
V0979	Low	Former	Regularly	Medium	Good	Healthy	High	Medium	Medium
V0980	Medium	Former	Regularly	Low	Poor	Healthy	Low	Low	High
V0981	High	Current	Never	Medium	Poor	Healthy	Low	High	Medium
V0982	Medium	Never	Never	High	Poor	Unhealthy	Low	High	Low
V0983	Low	Current	Regularly	High	Average	Unhealthy	Medium	High	High
V0984	Medium	Current	Occasionally	Medium	Average	Healthy	High	Low	Medium
V0985	Medium	Never	Regularly	High	Poor	Healthy	Medium	Medium	Low
V0986	High	Current	Never	High	Average	Healthy	Medium	Low	High
V0987	Medium	Never	Occasionally	Low	Good	Average	Low	Low	Low
V0988	Medium	Former	Never	Medium	Poor	Average	Medium	Low	Low
V0989	Medium	Current	Never	High	Poor	Healthy	Medium	High	Low
V0990	Low	Current	Never	High	Average	Average	Low	Medium	Low
V0991	Low	Former	Never	High	Good	Average	Low	High	High
V0992	Medium	Former	Never	High	Average	Healthy	Medium	Low	Low
V0993	Low	Former	Occasionally	Low	Good	Average	Low	High	Medium
V0994	Low	Never	Never	High	Average	Healthy	Medium	Medium	Low
V0995	High	Never	Occasionally	Medium	Average	Healthy	High	High	Low
V0996	High	Never	Regularly	High	Good	Healthy	Low	Low	Low
V0997	Low	Current	Occasionally	High	Good	Healthy	Low	Medium	High
V0998	High	Never	Occasionally	Medium	Poor	Unhealthy	Low	Low	High
V0999	High	Current	Never	High	Poor	Healthy	High	Low	Medium
V1000	High	Current	Occasionally	Low	Good	Unhealthy	High	High	High
\.


--
-- TOC entry 3698 (class 0 OID 16471)
-- Dependencies: 217
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: dadb
--

COPY public.patient (patient_id, age, gender, education_level, employment_status, marital_status, income_level, urban_vs_rural_living, family_history, genetic_risk_factor, physician_id) FROM stdin;
P0001	59	Male	16	Retired	Widowed	High	Rural	Yes	No	D02
P0002	57	Male	7	Unemployed	Married	High	Urban	No	No	D05
P0003	77	Male	16	Employed	Single	Medium	Urban	No	No	D01
P0004	94	Female	4	Retired	Married	Medium	Rural	No	No	D04
P0005	63	Female	15	Employed	Married	Medium	Urban	No	No	D05
P0006	79	Female	5	Employed	Widowed	High	Rural	No	No	D02
P0007	74	Male	15	Unemployed	Single	Low	Urban	No	No	D01
P0008	54	Female	11	Employed	Single	Medium	Urban	Yes	Yes	D04
P0009	74	Male	16	Retired	Single	Low	Rural	No	No	D05
P0010	61	Female	5	Retired	Widowed	Low	Rural	Yes	No	D01
P0011	60	Male	2	Employed	Widowed	High	Rural	No	No	D03
P0012	93	Male	9	Employed	Married	High	Rural	No	No	D02
P0013	62	Female	13	Employed	Single	Low	Urban	No	No	D01
P0014	84	Female	9	Employed	Single	High	Urban	No	No	D01
P0015	53	Female	12	Retired	Widowed	High	Rural	No	Yes	D03
P0016	60	Male	18	Retired	Widowed	Low	Rural	No	No	D05
P0017	83	Female	0	Employed	Single	Low	Urban	No	No	D01
P0018	72	Male	18	Unemployed	Married	Medium	Urban	Yes	No	D01
P0019	59	Female	10	Employed	Widowed	High	Rural	No	No	D04
P0020	84	Female	10	Unemployed	Married	Low	Urban	No	No	D04
P0021	73	Male	17	Employed	Single	Low	Urban	No	No	D05
P0022	55	Female	3	Retired	Married	Low	Rural	No	Yes	D02
P0023	92	Male	5	Unemployed	Widowed	Medium	Rural	No	No	D03
P0024	94	Male	15	Employed	Single	High	Rural	No	No	D01
P0025	76	Male	11	Retired	Married	High	Urban	No	No	D02
P0026	54	Female	5	Employed	Widowed	High	Urban	Yes	No	D05
P0027	73	Female	2	Unemployed	Married	High	Urban	No	Yes	D04
P0028	78	Female	9	Retired	Widowed	Low	Urban	No	Yes	D02
P0029	93	Male	13	Unemployed	Married	High	Rural	Yes	Yes	D02
P0030	84	Female	5	Retired	Widowed	Medium	Rural	Yes	No	D03
P0031	91	Female	10	Employed	Single	Medium	Rural	No	No	D04
P0032	72	Female	17	Retired	Widowed	Low	Urban	No	No	D01
P0033	71	Male	18	Retired	Married	Medium	Urban	No	No	D04
P0034	53	Male	8	Retired	Widowed	Low	Rural	No	No	D04
P0035	52	Male	18	Employed	Single	Medium	Rural	Yes	No	D04
P0036	51	Female	10	Unemployed	Married	High	Rural	Yes	Yes	D04
P0037	78	Male	5	Unemployed	Married	High	Rural	No	Yes	D05
P0038	73	Male	16	Retired	Married	High	Rural	Yes	No	D01
P0039	79	Female	1	Unemployed	Single	High	Urban	No	No	D03
P0040	76	Female	0	Unemployed	Single	Low	Rural	No	No	D03
P0041	53	Male	10	Retired	Married	Low	Rural	Yes	No	D05
P0042	52	Female	6	Employed	Widowed	Medium	Urban	No	No	D03
P0043	93	Male	8	Retired	Single	High	Urban	No	No	D05
P0044	76	Female	7	Unemployed	Married	Medium	Urban	No	Yes	D04
P0045	90	Female	11	Unemployed	Single	Medium	Urban	No	No	D04
P0046	50	Female	7	Unemployed	Married	Low	Rural	Yes	No	D01
P0047	70	Male	16	Unemployed	Single	Medium	Urban	Yes	No	D01
P0048	80	Female	18	Unemployed	Single	Medium	Rural	Yes	Yes	D01
P0049	91	Male	10	Retired	Married	Low	Urban	No	No	D04
P0050	53	Female	16	Unemployed	Married	High	Rural	No	No	D02
P0051	55	Female	8	Employed	Single	Low	Urban	Yes	No	D03
P0052	53	Female	14	Retired	Single	Medium	Urban	Yes	No	D05
P0053	58	Male	6	Unemployed	Single	Low	Urban	Yes	No	D04
P0054	62	Male	9	Unemployed	Widowed	Medium	Rural	No	No	D04
P0055	82	Female	2	Unemployed	Single	Low	Urban	Yes	No	D04
P0056	54	Female	14	Unemployed	Single	Medium	Urban	Yes	No	D02
P0057	68	Male	11	Unemployed	Widowed	High	Urban	Yes	Yes	D05
P0058	78	Male	6	Retired	Widowed	High	Urban	No	No	D03
P0059	92	Female	2	Employed	Married	Low	Urban	Yes	No	D04
P0060	83	Male	11	Unemployed	Single	High	Urban	No	Yes	D04
P0061	82	Male	15	Employed	Married	Medium	Rural	No	No	D02
P0062	56	Male	16	Unemployed	Widowed	High	Rural	Yes	No	D04
P0063	70	Female	16	Unemployed	Married	Low	Rural	No	No	D01
P0064	56	Male	6	Unemployed	Single	Medium	Urban	No	Yes	D05
P0065	54	Female	1	Retired	Widowed	Medium	Rural	No	No	D04
P0066	91	Male	5	Retired	Single	Low	Rural	Yes	No	D05
P0067	78	Male	10	Retired	Widowed	High	Rural	No	No	D02
P0068	67	Female	7	Unemployed	Married	Low	Rural	No	No	D01
P0069	87	Female	18	Retired	Widowed	High	Urban	No	No	D05
P0070	81	Male	10	Employed	Widowed	Medium	Rural	Yes	No	D02
P0071	53	Female	4	Employed	Widowed	Medium	Rural	No	Yes	D01
P0072	55	Male	11	Unemployed	Single	Medium	Urban	Yes	No	D04
P0073	58	Male	12	Retired	Married	High	Urban	No	No	D05
P0074	59	Female	5	Employed	Married	High	Urban	No	No	D02
P0075	69	Male	8	Retired	Married	Low	Rural	Yes	No	D03
P0076	85	Female	19	Unemployed	Married	Low	Urban	No	No	D03
P0077	51	Male	13	Unemployed	Married	Low	Urban	Yes	No	D04
P0078	82	Female	13	Retired	Single	Low	Urban	No	No	D02
P0079	75	Male	12	Unemployed	Widowed	High	Urban	No	No	D01
P0080	73	Female	18	Employed	Single	Low	Rural	No	No	D02
P0081	69	Male	16	Retired	Single	High	Urban	Yes	No	D02
P0082	60	Male	1	Employed	Single	Low	Urban	No	No	D05
P0083	75	Male	16	Employed	Widowed	Low	Rural	No	No	D03
P0084	64	Female	3	Retired	Married	Medium	Urban	No	No	D04
P0085	84	Male	13	Retired	Single	High	Rural	No	No	D04
P0086	63	Female	3	Unemployed	Single	High	Urban	Yes	Yes	D01
P0087	82	Female	2	Employed	Married	Medium	Urban	Yes	Yes	D05
P0088	59	Female	5	Retired	Married	Low	Rural	Yes	No	D02
P0089	78	Male	7	Retired	Married	Low	Rural	Yes	No	D05
P0090	88	Male	15	Employed	Single	Low	Urban	No	No	D01
P0091	67	Female	0	Employed	Single	Medium	Rural	No	No	D02
P0092	56	Male	3	Unemployed	Widowed	High	Urban	No	No	D04
P0093	88	Female	6	Employed	Single	Low	Rural	No	No	D03
P0094	89	Male	14	Employed	Married	Low	Rural	No	No	D04
P0095	59	Male	13	Retired	Married	Low	Rural	Yes	No	D01
P0096	80	Female	1	Unemployed	Single	Low	Urban	No	No	D05
P0097	86	Male	8	Employed	Single	High	Rural	No	Yes	D04
P0098	87	Male	7	Unemployed	Single	Low	Urban	No	No	D05
P0099	92	Female	10	Employed	Widowed	Low	Rural	No	No	D01
P0100	54	Male	5	Unemployed	Widowed	Low	Urban	Yes	Yes	D03
P0101	91	Male	3	Unemployed	Married	Low	Urban	No	No	D02
P0102	93	Female	6	Unemployed	Single	High	Rural	Yes	No	D03
P0103	90	Female	5	Employed	Single	High	Urban	No	No	D05
P0104	91	Male	16	Employed	Widowed	Low	Rural	No	No	D02
P0105	54	Female	5	Employed	Married	High	Rural	Yes	No	D05
P0106	65	Male	15	Employed	Married	High	Rural	Yes	No	D03
P0107	52	Male	2	Unemployed	Widowed	Medium	Rural	Yes	No	D01
P0108	74	Male	11	Employed	Widowed	Medium	Rural	No	Yes	D02
P0109	53	Female	0	Retired	Single	Low	Urban	No	No	D01
P0110	67	Female	3	Retired	Widowed	Low	Urban	Yes	No	D03
P0111	59	Male	8	Retired	Widowed	High	Urban	No	No	D01
P0112	72	Female	14	Unemployed	Single	High	Urban	Yes	No	D04
P0113	52	Female	8	Unemployed	Single	High	Urban	No	No	D05
P0114	70	Female	9	Employed	Widowed	High	Urban	No	No	D05
P0115	77	Female	16	Retired	Married	High	Urban	No	No	D03
P0116	87	Male	19	Employed	Widowed	Medium	Rural	No	No	D04
P0117	70	Female	4	Unemployed	Widowed	Medium	Rural	No	Yes	D04
P0118	58	Male	19	Retired	Single	Low	Urban	Yes	No	D01
P0119	55	Female	4	Unemployed	Married	High	Urban	Yes	No	D01
P0120	81	Male	4	Employed	Married	Medium	Rural	Yes	No	D01
P0121	82	Female	3	Retired	Single	Medium	Rural	Yes	No	D01
P0122	71	Male	18	Unemployed	Single	Low	Rural	No	Yes	D05
P0123	69	Female	17	Retired	Single	Low	Urban	No	No	D03
P0124	67	Male	9	Employed	Married	Low	Rural	No	Yes	D04
P0125	75	Male	13	Employed	Single	Low	Urban	Yes	No	D01
P0126	82	Female	8	Unemployed	Single	Medium	Urban	No	Yes	D02
P0127	87	Male	19	Retired	Single	Medium	Urban	No	No	D04
P0128	62	Male	4	Employed	Married	Medium	Rural	Yes	No	D04
P0129	64	Male	2	Employed	Single	Low	Rural	Yes	No	D01
P0130	51	Male	14	Employed	Single	Medium	Rural	Yes	No	D02
P0131	63	Female	8	Employed	Married	Low	Rural	No	No	D01
P0132	66	Female	9	Retired	Widowed	High	Urban	No	No	D02
P0133	68	Female	15	Unemployed	Married	Low	Rural	No	No	D01
P0134	56	Male	3	Employed	Widowed	High	Urban	Yes	No	D02
P0135	81	Male	8	Unemployed	Single	Medium	Urban	Yes	Yes	D01
P0136	75	Male	19	Unemployed	Widowed	Low	Urban	Yes	No	D02
P0137	66	Female	7	Retired	Single	Low	Rural	No	No	D04
P0138	69	Male	7	Employed	Married	Low	Rural	Yes	No	D03
P0139	87	Male	19	Unemployed	Single	Low	Rural	Yes	No	D04
P0140	92	Female	16	Employed	Widowed	High	Urban	No	No	D02
P0141	79	Male	13	Retired	Widowed	Low	Urban	No	No	D04
P0142	61	Female	2	Unemployed	Widowed	High	Urban	Yes	No	D01
P0143	92	Male	19	Employed	Single	High	Rural	No	No	D03
P0144	67	Male	16	Retired	Married	Low	Urban	Yes	No	D05
P0145	64	Female	7	Unemployed	Single	Medium	Rural	No	No	D05
P0146	65	Female	8	Employed	Single	High	Urban	No	No	D05
P0147	55	Female	15	Employed	Married	Low	Rural	Yes	Yes	D05
P0148	74	Female	12	Unemployed	Widowed	Low	Rural	No	No	D03
P0149	87	Female	6	Retired	Single	High	Urban	No	No	D05
P0150	90	Female	17	Retired	Married	High	Rural	No	No	D04
P0151	52	Female	12	Employed	Widowed	Medium	Urban	No	No	D01
P0152	59	Female	1	Employed	Married	Low	Rural	Yes	No	D03
P0153	72	Male	4	Employed	Single	Medium	Urban	No	No	D01
P0154	89	Female	18	Retired	Single	High	Urban	No	No	D03
P0155	90	Male	8	Unemployed	Married	Low	Urban	No	No	D05
P0156	57	Female	16	Retired	Widowed	Medium	Rural	No	No	D04
P0157	94	Male	17	Employed	Married	High	Rural	No	No	D03
P0158	71	Male	3	Unemployed	Single	Low	Rural	No	No	D01
P0159	80	Male	9	Employed	Single	Low	Urban	Yes	No	D03
P0160	91	Male	5	Employed	Single	Low	Rural	No	No	D01
P0161	51	Male	16	Unemployed	Single	Medium	Urban	No	No	D04
P0162	87	Female	18	Retired	Widowed	Low	Rural	No	Yes	D02
P0163	77	Female	16	Employed	Married	Low	Rural	No	No	D03
P0164	61	Female	18	Unemployed	Widowed	Medium	Rural	No	No	D04
P0165	93	Female	5	Retired	Married	Low	Urban	No	No	D02
P0166	90	Female	4	Unemployed	Married	Low	Urban	Yes	No	D01
P0167	74	Male	3	Employed	Married	Low	Urban	No	No	D02
P0168	78	Female	4	Unemployed	Single	Medium	Rural	No	No	D03
P0169	68	Female	7	Employed	Single	High	Rural	Yes	No	D02
P0170	57	Female	0	Employed	Single	Medium	Rural	No	No	D02
P0171	72	Female	3	Employed	Single	Medium	Urban	Yes	No	D02
P0172	83	Female	9	Employed	Single	Medium	Urban	No	No	D04
P0173	94	Male	6	Employed	Widowed	Low	Rural	No	No	D05
P0174	88	Female	12	Unemployed	Widowed	Medium	Urban	Yes	No	D04
P0175	85	Female	13	Unemployed	Widowed	Low	Rural	No	No	D01
P0176	54	Female	1	Retired	Widowed	Medium	Urban	No	Yes	D02
P0177	69	Male	6	Retired	Widowed	Low	Rural	No	Yes	D01
P0178	57	Female	13	Retired	Widowed	High	Rural	No	No	D04
P0179	61	Female	14	Retired	Widowed	High	Urban	Yes	No	D02
P0180	54	Male	3	Unemployed	Married	Medium	Urban	No	No	D01
P0181	53	Male	14	Employed	Married	Low	Urban	Yes	No	D02
P0182	66	Male	6	Employed	Single	Medium	Urban	Yes	No	D05
P0183	87	Female	4	Unemployed	Married	Medium	Urban	No	No	D05
P0184	63	Male	12	Employed	Widowed	High	Urban	Yes	No	D04
P0185	63	Male	15	Unemployed	Widowed	High	Rural	No	No	D05
P0186	92	Male	7	Retired	Widowed	Low	Rural	No	No	D03
P0187	84	Female	6	Unemployed	Single	High	Urban	No	No	D01
P0188	59	Male	6	Unemployed	Single	Medium	Urban	No	No	D04
P0189	74	Male	16	Employed	Married	Low	Rural	No	Yes	D04
P0190	66	Female	10	Employed	Single	Low	Urban	Yes	No	D04
P0191	58	Female	4	Retired	Single	High	Urban	No	No	D02
P0192	87	Male	1	Employed	Widowed	High	Rural	No	No	D03
P0193	90	Female	17	Retired	Widowed	High	Urban	Yes	No	D03
P0194	58	Male	1	Employed	Single	Medium	Urban	No	Yes	D05
P0195	60	Male	16	Retired	Single	High	Rural	Yes	No	D04
P0196	90	Female	9	Unemployed	Single	High	Rural	No	No	D02
P0197	84	Female	1	Employed	Single	Medium	Rural	No	No	D03
P0198	78	Male	1	Employed	Widowed	Medium	Rural	No	No	D04
P0199	80	Female	9	Retired	Married	Low	Rural	No	No	D03
P0200	90	Female	15	Unemployed	Single	Medium	Urban	Yes	No	D05
P0201	81	Female	10	Employed	Single	Medium	Urban	No	No	D04
P0202	72	Female	3	Retired	Widowed	Medium	Urban	No	No	D02
P0203	82	Male	19	Unemployed	Married	Medium	Rural	No	No	D04
P0204	87	Male	3	Employed	Single	Low	Rural	No	No	D05
P0205	50	Female	4	Unemployed	Single	High	Urban	Yes	No	D03
P0206	93	Male	1	Unemployed	Single	Medium	Urban	Yes	No	D05
P0207	83	Male	9	Retired	Married	Low	Urban	Yes	Yes	D03
P0208	89	Male	11	Retired	Single	Medium	Urban	Yes	No	D04
P0209	93	Male	16	Retired	Married	Medium	Rural	No	No	D01
P0210	55	Male	4	Retired	Widowed	High	Rural	No	No	D01
P0211	58	Male	13	Unemployed	Single	Medium	Urban	No	No	D03
P0212	59	Male	9	Employed	Widowed	Low	Rural	No	No	D05
P0213	53	Male	4	Employed	Single	Low	Urban	Yes	No	D03
P0214	79	Female	11	Employed	Married	High	Rural	No	No	D04
P0215	87	Male	14	Retired	Married	High	Rural	No	No	D05
P0216	75	Female	6	Employed	Widowed	High	Urban	Yes	No	D05
P0217	91	Male	15	Retired	Married	Medium	Urban	Yes	No	D04
P0218	63	Female	5	Employed	Widowed	Medium	Urban	Yes	No	D04
P0219	84	Male	2	Unemployed	Married	Medium	Urban	Yes	No	D03
P0220	71	Male	10	Unemployed	Married	Medium	Rural	No	No	D04
P0221	58	Male	5	Employed	Married	Medium	Urban	No	No	D01
P0222	60	Female	19	Unemployed	Single	Low	Rural	No	Yes	D03
P0223	61	Male	9	Retired	Single	Low	Rural	No	No	D02
P0224	51	Male	13	Retired	Married	Medium	Urban	Yes	No	D04
P0225	66	Male	2	Employed	Married	High	Rural	No	Yes	D05
P0226	66	Female	2	Retired	Single	Medium	Urban	No	No	D04
P0227	83	Male	17	Employed	Married	Medium	Rural	No	No	D03
P0228	81	Male	19	Retired	Married	High	Rural	No	No	D01
P0229	72	Female	14	Employed	Single	Medium	Rural	Yes	No	D04
P0230	85	Female	7	Employed	Married	Medium	Urban	No	No	D03
P0231	88	Male	8	Unemployed	Married	Medium	Urban	No	Yes	D03
P0232	84	Male	16	Retired	Widowed	Medium	Urban	No	Yes	D03
P0233	79	Male	18	Retired	Single	Medium	Urban	No	No	D02
P0234	67	Male	10	Retired	Married	High	Urban	Yes	No	D03
P0235	58	Male	1	Employed	Married	Low	Rural	No	Yes	D01
P0236	83	Female	14	Unemployed	Married	Low	Urban	Yes	Yes	D01
P0237	53	Female	17	Unemployed	Single	High	Urban	No	No	D01
P0238	92	Female	9	Unemployed	Single	High	Rural	Yes	Yes	D01
P0239	63	Male	12	Employed	Single	Low	Urban	Yes	No	D02
P0240	86	Male	3	Unemployed	Married	High	Rural	Yes	No	D02
P0241	66	Male	7	Unemployed	Widowed	Medium	Rural	No	No	D04
P0242	82	Male	11	Unemployed	Widowed	Medium	Urban	Yes	Yes	D04
P0243	59	Female	10	Employed	Single	High	Rural	No	No	D03
P0244	56	Female	5	Employed	Married	Medium	Urban	No	Yes	D05
P0245	88	Female	19	Retired	Single	Medium	Rural	Yes	No	D03
P0246	64	Female	10	Employed	Single	Low	Rural	No	No	D02
P0247	77	Male	5	Employed	Single	Low	Urban	No	No	D03
P0248	68	Female	1	Employed	Married	Low	Rural	Yes	Yes	D01
P0249	64	Female	6	Unemployed	Single	High	Urban	No	Yes	D02
P0250	81	Female	18	Employed	Married	High	Rural	No	Yes	D04
P0251	50	Male	0	Employed	Married	Medium	Rural	No	No	D05
P0252	72	Male	5	Retired	Married	Low	Rural	No	No	D05
P0253	76	Female	18	Unemployed	Widowed	Medium	Urban	Yes	No	D05
P0254	89	Male	16	Unemployed	Single	Medium	Rural	No	No	D01
P0255	87	Male	9	Unemployed	Single	Medium	Urban	Yes	No	D04
P0256	94	Female	4	Employed	Single	High	Urban	Yes	No	D01
P0257	53	Male	4	Employed	Married	High	Rural	No	No	D01
P0258	65	Male	6	Retired	Widowed	High	Rural	No	Yes	D03
P0259	89	Male	3	Unemployed	Single	Low	Rural	No	No	D05
P0260	83	Male	8	Unemployed	Married	Medium	Rural	No	No	D04
P0261	65	Female	18	Retired	Single	Medium	Urban	No	Yes	D01
P0262	72	Female	1	Retired	Single	Medium	Urban	No	No	D04
P0263	81	Female	13	Retired	Single	Medium	Urban	No	No	D01
P0264	74	Male	10	Employed	Married	Low	Urban	No	No	D04
P0265	88	Male	18	Employed	Married	Medium	Urban	No	No	D01
P0266	53	Female	17	Unemployed	Widowed	Medium	Rural	No	Yes	D03
P0267	86	Male	3	Retired	Married	Low	Rural	No	Yes	D04
P0268	89	Male	15	Employed	Single	Medium	Urban	No	No	D02
P0269	63	Female	5	Unemployed	Widowed	Low	Urban	Yes	No	D04
P0270	60	Female	15	Retired	Married	High	Rural	No	No	D01
P0271	60	Male	13	Retired	Single	Medium	Urban	Yes	No	D04
P0272	57	Female	6	Retired	Widowed	High	Rural	No	No	D05
P0273	86	Male	19	Employed	Single	Medium	Urban	Yes	No	D01
P0274	85	Female	3	Employed	Widowed	Medium	Rural	No	Yes	D01
P0275	60	Male	16	Unemployed	Widowed	Low	Urban	No	No	D04
P0276	94	Male	8	Retired	Widowed	High	Urban	Yes	Yes	D04
P0277	91	Female	9	Employed	Single	Low	Urban	No	Yes	D02
P0278	60	Female	13	Retired	Single	High	Urban	No	No	D02
P0279	64	Male	15	Unemployed	Widowed	Low	Rural	No	No	D02
P0280	72	Female	14	Unemployed	Single	Medium	Urban	No	Yes	D03
P0281	80	Male	19	Unemployed	Widowed	Medium	Urban	Yes	No	D04
P0282	68	Male	19	Retired	Widowed	Low	Rural	Yes	No	D05
P0283	77	Male	5	Employed	Widowed	High	Rural	Yes	No	D01
P0284	91	Male	17	Unemployed	Single	High	Rural	No	Yes	D05
P0285	93	Male	17	Retired	Widowed	Medium	Urban	No	No	D05
P0286	80	Male	1	Unemployed	Married	High	Rural	No	No	D03
P0287	77	Female	3	Employed	Married	Low	Rural	No	No	D02
P0288	69	Male	13	Retired	Married	High	Rural	Yes	No	D05
P0289	50	Female	10	Retired	Single	High	Urban	Yes	No	D04
P0290	63	Male	7	Employed	Single	Medium	Rural	No	No	D02
P0291	88	Male	13	Retired	Widowed	Medium	Rural	No	No	D04
P0292	53	Male	1	Retired	Married	Low	Urban	Yes	No	D02
P0293	73	Female	14	Retired	Married	Medium	Rural	Yes	No	D03
P0294	50	Female	2	Unemployed	Widowed	Low	Rural	No	Yes	D02
P0295	51	Female	5	Retired	Married	Medium	Rural	No	No	D03
P0296	62	Male	1	Employed	Widowed	Low	Urban	No	No	D02
P0297	73	Female	16	Employed	Widowed	High	Urban	Yes	No	D04
P0298	51	Female	9	Retired	Widowed	High	Urban	No	No	D04
P0299	74	Female	3	Retired	Single	Low	Rural	No	No	D01
P0300	65	Female	8	Retired	Widowed	Medium	Rural	No	No	D05
P0301	75	Female	9	Unemployed	Widowed	Low	Urban	No	No	D05
P0302	56	Female	11	Retired	Married	High	Urban	No	No	D02
P0303	78	Male	17	Employed	Widowed	Low	Rural	No	No	D02
P0304	93	Male	7	Retired	Widowed	Medium	Urban	No	No	D02
P0305	65	Male	10	Employed	Single	High	Urban	No	No	D01
P0306	60	Female	9	Unemployed	Single	High	Urban	No	No	D01
P0307	93	Male	1	Unemployed	Married	Low	Rural	Yes	Yes	D04
P0308	55	Male	19	Employed	Widowed	High	Urban	No	No	D01
P0309	71	Male	15	Unemployed	Widowed	High	Rural	No	No	D05
P0310	53	Male	8	Unemployed	Widowed	High	Urban	Yes	No	D01
P0311	76	Male	4	Retired	Single	Low	Rural	Yes	No	D05
P0312	54	Male	19	Unemployed	Widowed	Low	Rural	Yes	No	D03
P0313	93	Male	13	Unemployed	Widowed	Low	Rural	No	Yes	D03
P0314	62	Female	6	Retired	Married	Medium	Urban	No	No	D02
P0315	55	Female	6	Retired	Widowed	Low	Rural	No	Yes	D04
P0316	73	Female	12	Unemployed	Married	High	Urban	No	Yes	D05
P0317	56	Female	19	Employed	Married	Low	Urban	Yes	Yes	D03
P0318	74	Female	5	Retired	Single	Low	Rural	No	No	D02
P0319	61	Male	16	Retired	Single	Medium	Urban	Yes	No	D04
P0320	66	Male	18	Employed	Married	High	Urban	No	No	D05
P0321	57	Male	9	Retired	Single	High	Urban	No	No	D02
P0322	69	Male	5	Retired	Single	Low	Rural	Yes	Yes	D05
P0323	54	Female	3	Employed	Widowed	Medium	Rural	No	No	D03
P0324	52	Female	4	Retired	Married	Low	Rural	Yes	No	D01
P0325	81	Female	0	Retired	Widowed	Low	Rural	No	No	D03
P0326	62	Female	7	Employed	Married	High	Urban	No	No	D04
P0327	68	Female	3	Employed	Widowed	Low	Rural	Yes	Yes	D02
P0328	77	Female	9	Retired	Single	High	Urban	No	No	D02
P0329	81	Female	7	Employed	Single	Low	Rural	No	No	D05
P0330	83	Male	11	Employed	Married	Low	Urban	No	No	D05
P0331	81	Male	5	Unemployed	Married	High	Rural	No	No	D01
P0332	88	Male	0	Retired	Widowed	Medium	Urban	Yes	No	D03
P0333	79	Female	14	Unemployed	Married	Medium	Rural	No	No	D02
P0334	81	Female	11	Retired	Married	High	Urban	No	Yes	D02
P0335	64	Male	16	Employed	Married	High	Urban	Yes	No	D02
P0336	55	Male	9	Retired	Widowed	Medium	Rural	Yes	No	D01
P0337	77	Female	14	Retired	Married	High	Rural	Yes	No	D03
P0338	71	Male	5	Unemployed	Single	Medium	Urban	Yes	No	D01
P0339	93	Female	19	Employed	Married	Low	Urban	No	No	D02
P0340	57	Male	13	Employed	Single	Medium	Rural	No	No	D05
P0341	64	Male	1	Unemployed	Married	High	Rural	Yes	Yes	D01
P0342	70	Male	13	Unemployed	Single	High	Urban	No	Yes	D02
P0343	70	Female	6	Employed	Widowed	Low	Urban	No	Yes	D03
P0344	89	Male	15	Retired	Married	Low	Rural	No	Yes	D01
P0345	80	Male	19	Employed	Single	Low	Urban	No	Yes	D04
P0346	91	Male	8	Employed	Married	Low	Urban	No	No	D04
P0347	84	Female	16	Retired	Married	Low	Urban	Yes	No	D03
P0348	59	Male	4	Unemployed	Married	High	Rural	No	No	D04
P0349	62	Female	2	Unemployed	Widowed	Medium	Urban	No	Yes	D02
P0350	58	Female	10	Unemployed	Widowed	Low	Rural	Yes	No	D05
P0351	85	Female	14	Retired	Married	Low	Rural	No	Yes	D05
P0352	76	Male	10	Retired	Single	Low	Rural	Yes	No	D02
P0353	53	Male	13	Retired	Married	High	Urban	No	No	D04
P0354	70	Female	8	Retired	Widowed	Low	Rural	No	No	D02
P0355	57	Male	8	Employed	Married	Medium	Urban	No	No	D01
P0356	55	Male	17	Retired	Married	Low	Urban	No	Yes	D03
P0357	63	Female	4	Unemployed	Widowed	High	Rural	Yes	No	D05
P0358	90	Male	10	Retired	Single	Medium	Rural	No	No	D03
P0359	74	Female	1	Unemployed	Married	Low	Urban	No	No	D04
P0360	71	Male	3	Unemployed	Married	Low	Rural	Yes	No	D03
P0361	58	Male	1	Unemployed	Widowed	High	Rural	No	No	D01
P0362	69	Female	17	Unemployed	Widowed	Medium	Urban	No	No	D04
P0363	61	Female	11	Employed	Widowed	High	Urban	No	No	D05
P0364	90	Female	11	Unemployed	Single	High	Rural	Yes	No	D04
P0365	69	Female	12	Retired	Married	Medium	Urban	No	No	D01
P0366	70	Female	2	Unemployed	Single	Low	Urban	No	No	D04
P0367	79	Male	2	Unemployed	Widowed	High	Urban	Yes	No	D05
P0368	80	Male	2	Employed	Married	Medium	Rural	No	No	D05
P0369	58	Male	8	Unemployed	Single	Medium	Urban	No	Yes	D05
P0370	91	Female	9	Retired	Single	Low	Rural	No	No	D05
P0371	75	Male	4	Retired	Widowed	Medium	Rural	Yes	No	D01
P0372	79	Female	4	Retired	Married	Medium	Urban	No	No	D03
P0373	82	Female	16	Unemployed	Widowed	Medium	Urban	Yes	Yes	D05
P0374	83	Male	12	Retired	Widowed	High	Rural	Yes	No	D01
P0375	55	Female	19	Retired	Married	High	Rural	No	Yes	D02
P0376	53	Male	10	Employed	Single	High	Rural	No	Yes	D05
P0377	87	Male	0	Employed	Widowed	Medium	Rural	No	No	D02
P0378	80	Female	6	Unemployed	Widowed	Low	Urban	No	Yes	D02
P0379	88	Female	2	Retired	Widowed	Low	Urban	No	No	D04
P0380	82	Male	10	Unemployed	Widowed	Low	Rural	No	Yes	D01
P0381	89	Male	17	Unemployed	Married	Medium	Urban	Yes	Yes	D05
P0382	58	Female	14	Employed	Single	High	Urban	Yes	Yes	D05
P0383	89	Female	3	Unemployed	Widowed	Medium	Urban	No	No	D04
P0384	55	Female	0	Retired	Widowed	High	Urban	Yes	No	D05
P0385	60	Female	3	Retired	Single	High	Rural	No	No	D01
P0386	59	Male	5	Employed	Married	Low	Urban	Yes	Yes	D05
P0387	83	Male	14	Retired	Married	Medium	Urban	No	No	D01
P0388	80	Female	12	Unemployed	Single	High	Urban	No	No	D02
P0389	92	Female	18	Unemployed	Widowed	Low	Urban	No	Yes	D04
P0390	65	Female	17	Unemployed	Single	High	Rural	Yes	No	D03
P0391	63	Male	13	Retired	Widowed	High	Rural	Yes	No	D04
P0392	61	Female	16	Retired	Married	Medium	Urban	No	No	D05
P0393	62	Male	16	Retired	Married	Low	Urban	No	Yes	D03
P0394	87	Female	12	Retired	Single	Medium	Urban	No	No	D02
P0395	67	Female	16	Unemployed	Widowed	High	Rural	No	No	D01
P0396	61	Female	8	Unemployed	Married	High	Urban	Yes	No	D05
P0397	76	Female	12	Retired	Widowed	Medium	Rural	No	Yes	D01
P0398	82	Male	14	Unemployed	Widowed	Medium	Rural	No	No	D05
P0399	62	Female	8	Retired	Widowed	High	Rural	Yes	No	D04
P0400	71	Male	19	Employed	Widowed	High	Rural	No	No	D02
P0401	94	Female	10	Unemployed	Married	Low	Urban	No	No	D03
P0402	76	Male	7	Employed	Single	Medium	Rural	No	No	D04
P0403	91	Female	0	Employed	Married	Low	Rural	No	No	D03
P0404	70	Female	19	Employed	Widowed	High	Urban	Yes	No	D03
P0405	72	Male	2	Unemployed	Single	Medium	Rural	No	No	D01
P0406	81	Female	5	Unemployed	Married	Medium	Rural	No	No	D05
P0407	93	Male	5	Unemployed	Widowed	Low	Rural	Yes	No	D04
P0408	83	Female	19	Unemployed	Widowed	Medium	Urban	No	No	D01
P0409	91	Female	5	Unemployed	Single	High	Rural	No	No	D01
P0410	90	Female	6	Retired	Widowed	Medium	Rural	Yes	Yes	D05
P0411	87	Female	17	Retired	Widowed	Low	Urban	Yes	Yes	D03
P0412	57	Male	0	Employed	Single	Medium	Urban	No	No	D03
P0413	78	Female	6	Unemployed	Single	Medium	Urban	No	No	D02
P0414	61	Male	6	Employed	Widowed	Low	Urban	Yes	No	D01
P0415	88	Male	7	Unemployed	Single	Medium	Urban	No	No	D02
P0416	56	Male	12	Unemployed	Single	Medium	Rural	No	No	D01
P0417	70	Female	18	Retired	Single	Medium	Rural	Yes	No	D02
P0418	50	Female	16	Retired	Married	High	Urban	Yes	No	D04
P0419	66	Female	10	Employed	Married	Low	Urban	No	No	D01
P0420	87	Female	13	Unemployed	Married	Low	Urban	No	No	D05
P0421	68	Male	4	Employed	Widowed	Medium	Urban	No	No	D01
P0422	81	Male	5	Unemployed	Single	High	Rural	Yes	No	D02
P0423	64	Female	15	Unemployed	Widowed	High	Rural	No	No	D04
P0424	81	Female	10	Retired	Married	Low	Rural	No	No	D01
P0425	92	Female	16	Employed	Single	Medium	Rural	Yes	No	D05
P0426	69	Male	9	Retired	Widowed	Low	Rural	No	No	D03
P0427	85	Male	7	Retired	Widowed	Low	Rural	Yes	No	D02
P0428	74	Female	6	Retired	Widowed	Medium	Urban	Yes	No	D01
P0429	84	Male	19	Employed	Widowed	High	Rural	Yes	Yes	D04
P0430	57	Male	4	Retired	Married	Low	Rural	Yes	No	D01
P0431	83	Female	8	Employed	Single	Low	Urban	No	No	D03
P0432	74	Male	11	Employed	Married	Medium	Rural	Yes	No	D02
P0433	84	Male	5	Retired	Single	Low	Rural	No	No	D04
P0434	78	Male	7	Employed	Single	Medium	Urban	No	No	D05
P0435	86	Male	1	Unemployed	Widowed	Low	Rural	Yes	No	D02
P0436	74	Female	10	Retired	Widowed	Low	Rural	No	No	D03
P0437	62	Male	14	Unemployed	Single	Medium	Urban	No	Yes	D04
P0438	67	Male	5	Employed	Widowed	Medium	Rural	No	No	D05
P0439	76	Female	0	Unemployed	Married	High	Urban	No	No	D05
P0440	91	Female	7	Employed	Single	Medium	Rural	No	No	D02
P0441	59	Female	6	Retired	Married	High	Urban	Yes	No	D04
P0442	85	Male	6	Retired	Single	Low	Urban	No	No	D03
P0443	68	Male	3	Employed	Single	High	Urban	No	Yes	D05
P0444	93	Male	15	Unemployed	Married	Medium	Urban	No	No	D01
P0445	59	Male	6	Unemployed	Single	Medium	Rural	No	No	D01
P0446	54	Female	4	Employed	Widowed	Low	Urban	No	No	D03
P0447	51	Male	3	Employed	Married	High	Rural	Yes	No	D01
P0448	67	Male	1	Retired	Married	High	Rural	No	No	D03
P0449	51	Male	2	Employed	Single	Low	Urban	No	No	D04
P0450	64	Female	10	Retired	Widowed	Low	Rural	Yes	No	D01
P0451	83	Male	7	Employed	Widowed	High	Urban	No	No	D04
P0452	84	Male	4	Employed	Single	High	Rural	Yes	No	D01
P0453	90	Female	19	Retired	Widowed	High	Urban	No	No	D03
P0454	65	Female	19	Unemployed	Married	Medium	Urban	No	No	D02
P0455	77	Male	2	Retired	Widowed	High	Rural	No	No	D04
P0456	72	Female	1	Unemployed	Married	Medium	Rural	Yes	No	D02
P0457	79	Male	15	Retired	Single	Low	Urban	Yes	Yes	D05
P0458	89	Female	14	Employed	Widowed	High	Rural	No	No	D05
P0459	71	Male	18	Employed	Married	Low	Urban	Yes	No	D02
P0460	57	Male	16	Unemployed	Married	High	Urban	Yes	No	D05
P0461	93	Female	12	Employed	Married	High	Urban	No	No	D05
P0462	53	Male	15	Retired	Widowed	Medium	Urban	No	No	D04
P0463	66	Female	4	Unemployed	Single	Low	Rural	No	No	D04
P0464	55	Female	19	Unemployed	Married	High	Rural	No	No	D04
P0465	89	Male	9	Unemployed	Widowed	Low	Urban	No	No	D02
P0466	57	Female	14	Retired	Widowed	Medium	Urban	No	Yes	D05
P0467	51	Male	17	Unemployed	Married	High	Urban	No	No	D02
P0468	86	Male	13	Employed	Married	Low	Urban	No	No	D01
P0469	62	Male	10	Unemployed	Widowed	Medium	Urban	No	No	D01
P0470	51	Female	16	Retired	Married	Medium	Rural	No	No	D05
P0471	78	Male	2	Retired	Single	Medium	Urban	No	No	D05
P0472	52	Female	2	Unemployed	Widowed	Medium	Rural	No	Yes	D03
P0473	56	Male	19	Employed	Single	Low	Rural	Yes	No	D01
P0474	70	Male	14	Employed	Married	High	Rural	No	No	D04
P0475	93	Female	3	Unemployed	Married	High	Rural	No	No	D02
P0476	91	Male	4	Unemployed	Married	High	Rural	No	Yes	D01
P0477	86	Male	17	Unemployed	Married	High	Urban	No	No	D01
P0478	79	Male	14	Unemployed	Widowed	High	Rural	Yes	No	D04
P0479	94	Female	6	Unemployed	Widowed	Low	Urban	Yes	No	D01
P0480	93	Female	1	Retired	Single	Medium	Urban	No	No	D04
P0481	70	Female	6	Retired	Widowed	High	Rural	No	Yes	D03
P0482	71	Female	3	Unemployed	Widowed	High	Urban	Yes	No	D04
P0483	71	Male	16	Employed	Widowed	High	Rural	Yes	No	D04
P0484	65	Male	16	Employed	Widowed	Low	Urban	No	No	D01
P0485	57	Male	5	Retired	Widowed	Medium	Rural	No	No	D04
P0486	59	Female	10	Retired	Married	Low	Urban	Yes	Yes	D04
P0487	92	Female	0	Unemployed	Widowed	Low	Rural	No	No	D01
P0488	79	Female	18	Retired	Married	Medium	Rural	No	No	D02
P0489	87	Female	6	Employed	Single	High	Rural	No	No	D04
P0490	71	Female	6	Retired	Widowed	High	Urban	No	No	D03
P0491	56	Male	4	Retired	Married	Medium	Urban	No	No	D05
P0492	79	Female	14	Employed	Married	Medium	Rural	No	No	D01
P0493	78	Female	12	Unemployed	Widowed	High	Rural	No	No	D03
P0494	58	Male	2	Retired	Married	High	Urban	No	No	D05
P0495	71	Male	4	Employed	Single	Medium	Urban	No	No	D05
P0496	67	Male	16	Unemployed	Widowed	Low	Urban	No	No	D02
P0497	50	Male	13	Employed	Single	Medium	Urban	No	No	D03
P0498	64	Male	19	Unemployed	Widowed	High	Rural	Yes	No	D03
P0499	62	Female	12	Employed	Widowed	High	Urban	No	No	D05
P0500	66	Male	2	Unemployed	Widowed	Medium	Urban	Yes	No	D04
P0501	63	Male	7	Unemployed	Married	Medium	Rural	No	No	D02
P0502	72	Female	0	Employed	Married	Low	Rural	No	Yes	D01
P0503	86	Male	6	Unemployed	Married	Low	Urban	No	No	D05
P0504	77	Male	19	Employed	Single	Medium	Urban	Yes	No	D04
P0505	74	Male	13	Unemployed	Widowed	Low	Urban	No	No	D05
P0506	67	Female	3	Unemployed	Widowed	Low	Rural	No	No	D05
P0507	94	Male	5	Unemployed	Married	High	Urban	No	No	D05
P0508	53	Male	0	Unemployed	Married	High	Rural	No	No	D04
P0509	67	Female	8	Unemployed	Married	Low	Urban	No	No	D05
P0510	59	Male	1	Retired	Widowed	High	Urban	Yes	Yes	D04
P0511	88	Male	4	Employed	Married	Medium	Rural	No	No	D05
P0512	64	Male	8	Employed	Widowed	High	Urban	Yes	No	D01
P0513	70	Female	17	Retired	Single	Low	Rural	No	No	D05
P0514	94	Female	12	Retired	Widowed	High	Urban	No	No	D05
P0515	67	Female	17	Unemployed	Widowed	High	Rural	Yes	No	D02
P0516	59	Male	5	Unemployed	Widowed	High	Urban	No	No	D02
P0517	65	Female	19	Retired	Married	Medium	Urban	No	Yes	D05
P0518	82	Female	4	Unemployed	Single	High	Rural	No	No	D04
P0519	62	Female	0	Employed	Married	Low	Rural	Yes	No	D04
P0520	92	Female	5	Unemployed	Widowed	Medium	Rural	Yes	No	D04
P0521	82	Female	15	Employed	Single	Low	Rural	No	No	D03
P0522	50	Female	19	Unemployed	Single	Medium	Rural	Yes	Yes	D01
P0523	50	Female	10	Employed	Widowed	Low	Urban	No	No	D01
P0524	83	Male	15	Retired	Single	Medium	Rural	No	Yes	D04
P0525	91	Female	9	Employed	Widowed	Low	Urban	No	No	D05
P0526	75	Female	12	Employed	Widowed	High	Urban	No	No	D05
P0527	93	Male	6	Unemployed	Single	Low	Rural	No	No	D03
P0528	84	Female	5	Employed	Single	Medium	Urban	No	Yes	D01
P0529	79	Male	18	Unemployed	Single	High	Urban	No	Yes	D02
P0530	87	Female	0	Unemployed	Married	Medium	Urban	No	No	D04
P0531	68	Female	18	Unemployed	Married	Low	Urban	No	No	D03
P0532	58	Male	0	Unemployed	Widowed	Medium	Rural	No	Yes	D02
P0533	93	Male	17	Employed	Single	High	Urban	No	No	D01
P0534	81	Female	17	Retired	Single	Medium	Rural	No	Yes	D01
P0535	76	Male	15	Employed	Married	High	Urban	No	No	D05
P0536	73	Female	12	Unemployed	Single	High	Urban	No	No	D03
P0537	67	Female	12	Unemployed	Married	Low	Urban	No	No	D04
P0538	63	Female	1	Unemployed	Single	Low	Urban	No	Yes	D04
P0539	64	Male	7	Unemployed	Widowed	Medium	Rural	Yes	No	D05
P0540	84	Male	7	Unemployed	Married	Medium	Rural	No	No	D03
P0541	90	Male	11	Retired	Widowed	Low	Rural	No	No	D01
P0542	83	Female	0	Unemployed	Married	Low	Urban	No	Yes	D05
P0543	65	Female	15	Employed	Single	High	Rural	Yes	No	D03
P0544	74	Male	10	Unemployed	Widowed	High	Urban	No	Yes	D04
P0545	85	Female	7	Unemployed	Married	High	Rural	No	No	D02
P0546	60	Male	16	Employed	Single	High	Rural	Yes	Yes	D03
P0547	79	Female	5	Unemployed	Widowed	Medium	Urban	No	No	D03
P0548	93	Female	3	Employed	Married	Medium	Rural	No	No	D02
P0549	64	Female	12	Unemployed	Single	High	Urban	No	No	D03
P0550	60	Female	13	Retired	Single	Medium	Rural	No	No	D05
P0551	65	Male	6	Employed	Married	Low	Urban	No	No	D02
P0552	93	Male	3	Retired	Married	High	Rural	No	No	D04
P0553	60	Female	5	Unemployed	Widowed	Medium	Urban	No	No	D02
P0554	55	Male	9	Employed	Single	High	Urban	Yes	Yes	D02
P0555	90	Female	12	Retired	Widowed	High	Urban	Yes	No	D03
P0556	75	Female	15	Retired	Widowed	Medium	Urban	No	No	D02
P0557	84	Female	16	Unemployed	Married	High	Urban	No	No	D01
P0558	77	Male	1	Retired	Single	High	Urban	Yes	No	D05
P0559	54	Male	0	Unemployed	Widowed	Medium	Rural	No	Yes	D02
P0560	76	Female	12	Employed	Widowed	High	Rural	No	No	D02
P0561	76	Female	4	Employed	Widowed	Low	Urban	No	Yes	D03
P0562	72	Female	2	Unemployed	Single	Medium	Rural	No	No	D03
P0563	52	Female	8	Employed	Widowed	Medium	Rural	Yes	Yes	D05
P0564	79	Female	4	Retired	Married	Medium	Urban	No	No	D02
P0565	55	Female	19	Unemployed	Widowed	Low	Urban	No	No	D04
P0566	63	Female	14	Employed	Widowed	High	Rural	Yes	No	D02
P0567	76	Female	8	Employed	Widowed	Medium	Urban	No	No	D03
P0568	57	Female	11	Unemployed	Widowed	High	Urban	No	No	D02
P0569	57	Male	10	Unemployed	Married	High	Rural	Yes	No	D02
P0570	54	Female	17	Unemployed	Married	Low	Urban	No	No	D05
P0571	76	Female	18	Retired	Single	Low	Urban	No	No	D04
P0572	74	Male	15	Unemployed	Married	High	Rural	No	No	D03
P0573	66	Female	11	Retired	Single	Low	Urban	No	No	D02
P0574	51	Female	6	Retired	Single	Low	Urban	No	No	D05
P0575	77	Male	15	Unemployed	Widowed	Low	Urban	Yes	No	D03
P0576	77	Female	7	Unemployed	Single	High	Rural	Yes	No	D02
P0577	62	Male	10	Unemployed	Single	High	Rural	No	Yes	D01
P0578	55	Female	6	Unemployed	Widowed	Medium	Urban	No	No	D01
P0579	71	Male	3	Retired	Single	Medium	Urban	Yes	No	D01
P0580	70	Female	17	Retired	Widowed	Low	Rural	No	Yes	D03
P0581	72	Female	7	Retired	Widowed	Low	Rural	No	No	D03
P0582	92	Male	5	Unemployed	Widowed	Medium	Rural	No	No	D02
P0583	78	Female	2	Unemployed	Married	High	Urban	No	No	D05
P0584	81	Female	10	Unemployed	Single	Medium	Urban	No	Yes	D05
P0585	53	Female	16	Unemployed	Widowed	Low	Rural	No	Yes	D02
P0586	91	Male	9	Unemployed	Widowed	Medium	Urban	No	No	D01
P0587	68	Female	19	Unemployed	Single	Low	Urban	No	No	D02
P0588	76	Male	0	Retired	Single	Low	Urban	No	No	D04
P0589	60	Male	10	Unemployed	Single	High	Urban	Yes	No	D04
P0590	64	Male	12	Retired	Married	Low	Urban	No	No	D02
P0591	58	Male	8	Unemployed	Widowed	High	Urban	No	No	D03
P0592	79	Female	10	Retired	Single	Low	Urban	Yes	No	D03
P0593	54	Male	0	Employed	Married	Low	Urban	No	No	D05
P0594	94	Female	5	Unemployed	Single	High	Rural	No	No	D05
P0595	62	Female	13	Employed	Single	Medium	Urban	No	No	D03
P0596	67	Female	5	Employed	Married	Low	Urban	No	Yes	D05
P0597	66	Female	18	Unemployed	Single	High	Urban	No	No	D05
P0598	88	Male	8	Retired	Married	Medium	Urban	No	No	D05
P0599	94	Male	1	Retired	Single	Medium	Urban	No	No	D02
P0600	63	Female	10	Retired	Single	Medium	Rural	No	No	D02
P0601	69	Female	15	Employed	Single	Low	Urban	No	No	D01
P0602	58	Female	19	Retired	Married	High	Rural	Yes	No	D04
P0603	87	Female	11	Unemployed	Single	Medium	Rural	No	No	D03
P0604	80	Male	19	Retired	Widowed	High	Rural	No	No	D04
P0605	92	Female	10	Unemployed	Widowed	Medium	Urban	Yes	Yes	D03
P0606	57	Male	9	Employed	Single	Medium	Urban	No	No	D04
P0607	54	Male	18	Retired	Married	Medium	Rural	No	No	D01
P0608	88	Female	2	Unemployed	Single	High	Rural	No	No	D02
P0609	80	Female	15	Unemployed	Single	Medium	Rural	No	No	D04
P0610	67	Female	17	Retired	Married	Low	Urban	No	Yes	D03
P0611	76	Male	16	Retired	Married	Medium	Rural	No	Yes	D02
P0612	73	Male	4	Unemployed	Single	Low	Rural	No	Yes	D03
P0613	50	Male	1	Unemployed	Married	Low	Urban	Yes	No	D03
P0614	94	Female	7	Unemployed	Married	High	Urban	No	No	D03
P0615	94	Male	7	Employed	Widowed	Low	Rural	No	No	D02
P0616	81	Female	13	Retired	Widowed	High	Urban	No	No	D02
P0617	61	Male	14	Retired	Single	Medium	Urban	Yes	No	D03
P0618	75	Male	6	Retired	Married	Low	Rural	No	No	D04
P0619	71	Female	17	Employed	Single	High	Urban	No	No	D02
P0620	72	Female	1	Employed	Married	High	Urban	No	No	D05
P0621	56	Male	1	Retired	Widowed	Medium	Rural	No	No	D04
P0622	72	Female	16	Unemployed	Single	Medium	Urban	Yes	No	D03
P0623	51	Male	1	Unemployed	Single	Medium	Urban	Yes	No	D01
P0624	85	Male	19	Unemployed	Widowed	Medium	Urban	No	Yes	D02
P0625	81	Female	4	Retired	Single	Medium	Rural	No	No	D02
P0626	77	Male	4	Retired	Widowed	Low	Rural	No	No	D01
P0627	67	Female	12	Unemployed	Single	Medium	Urban	Yes	Yes	D02
P0628	62	Female	9	Retired	Single	High	Rural	Yes	Yes	D02
P0629	91	Male	11	Unemployed	Single	High	Rural	Yes	No	D05
P0630	63	Female	1	Employed	Single	Medium	Rural	Yes	Yes	D05
P0631	82	Male	13	Unemployed	Widowed	Medium	Rural	No	Yes	D05
P0632	70	Male	15	Unemployed	Married	High	Urban	No	Yes	D03
P0633	72	Female	9	Employed	Married	Low	Rural	No	Yes	D02
P0634	50	Male	18	Retired	Widowed	Medium	Rural	No	No	D01
P0635	52	Male	14	Retired	Married	High	Rural	No	No	D02
P0636	59	Male	4	Unemployed	Widowed	Medium	Urban	No	Yes	D01
P0637	80	Female	0	Unemployed	Widowed	Medium	Urban	Yes	No	D02
P0638	82	Female	15	Retired	Widowed	High	Urban	No	No	D02
P0639	93	Female	15	Employed	Married	Medium	Rural	Yes	No	D05
P0640	61	Female	13	Employed	Widowed	High	Urban	No	No	D01
P0641	55	Male	16	Retired	Widowed	Medium	Rural	Yes	No	D02
P0642	52	Male	17	Retired	Widowed	Low	Rural	No	No	D03
P0643	65	Female	3	Unemployed	Single	High	Rural	No	No	D03
P0644	63	Male	14	Employed	Married	Low	Urban	No	Yes	D04
P0645	94	Male	9	Retired	Widowed	High	Rural	Yes	No	D02
P0646	60	Male	17	Retired	Widowed	Low	Urban	No	No	D02
P0647	93	Female	1	Retired	Widowed	Medium	Urban	No	No	D02
P0648	65	Male	6	Employed	Single	High	Rural	No	No	D05
P0649	91	Male	16	Unemployed	Widowed	High	Urban	Yes	Yes	D05
P0650	94	Female	2	Employed	Married	High	Urban	No	No	D01
P0651	80	Male	14	Retired	Single	Medium	Rural	No	No	D01
P0652	50	Male	8	Employed	Single	High	Rural	No	No	D05
P0653	55	Male	9	Retired	Married	Low	Urban	No	No	D03
P0654	80	Male	5	Employed	Widowed	Medium	Urban	Yes	No	D04
P0655	51	Male	12	Employed	Married	Medium	Rural	Yes	No	D04
P0656	71	Female	18	Unemployed	Single	High	Rural	Yes	No	D03
P0657	90	Male	2	Unemployed	Widowed	Low	Rural	No	No	D05
P0658	79	Female	5	Unemployed	Single	Medium	Rural	No	No	D05
P0659	55	Male	12	Employed	Widowed	Low	Urban	Yes	No	D04
P0660	65	Female	16	Unemployed	Married	Low	Urban	Yes	No	D01
P0661	87	Male	8	Unemployed	Single	Medium	Urban	No	No	D03
P0662	75	Female	10	Employed	Married	Medium	Urban	Yes	No	D05
P0663	83	Male	6	Unemployed	Single	Medium	Urban	Yes	No	D03
P0664	76	Female	8	Employed	Married	Medium	Urban	No	Yes	D05
P0665	52	Female	15	Unemployed	Widowed	Medium	Rural	Yes	No	D05
P0666	55	Male	0	Employed	Single	Low	Urban	Yes	No	D05
P0667	94	Female	9	Unemployed	Married	High	Urban	Yes	No	D01
P0668	93	Male	12	Unemployed	Married	High	Rural	No	No	D01
P0669	69	Male	15	Unemployed	Married	Low	Rural	Yes	No	D01
P0670	88	Male	0	Employed	Single	Medium	Rural	No	Yes	D01
P0671	86	Female	19	Employed	Married	Low	Urban	No	No	D04
P0672	76	Female	11	Retired	Single	Medium	Urban	No	No	D04
P0673	84	Female	11	Retired	Widowed	High	Urban	Yes	No	D02
P0674	68	Male	18	Retired	Widowed	Medium	Rural	No	No	D02
P0675	67	Male	6	Unemployed	Widowed	Low	Rural	No	No	D02
P0676	78	Female	3	Retired	Married	Low	Urban	Yes	No	D04
P0677	51	Female	12	Employed	Married	High	Urban	Yes	Yes	D03
P0678	92	Female	6	Retired	Widowed	High	Rural	Yes	No	D04
P0679	76	Male	19	Employed	Widowed	High	Urban	No	No	D05
P0680	90	Male	16	Retired	Single	High	Rural	Yes	No	D03
P0681	79	Female	12	Retired	Single	Low	Rural	No	No	D03
P0682	79	Female	14	Unemployed	Single	High	Urban	No	No	D04
P0683	75	Male	11	Unemployed	Widowed	Low	Rural	No	No	D04
P0684	56	Female	16	Employed	Single	Medium	Urban	No	No	D03
P0685	63	Male	2	Unemployed	Married	Low	Rural	No	Yes	D04
P0686	79	Female	10	Unemployed	Single	Low	Rural	Yes	No	D03
P0687	59	Female	3	Employed	Married	Medium	Urban	Yes	No	D02
P0688	50	Female	14	Unemployed	Single	Medium	Rural	No	No	D02
P0689	82	Male	7	Retired	Widowed	Low	Urban	No	No	D03
P0690	85	Female	14	Employed	Married	Low	Rural	No	No	D04
P0691	59	Female	16	Retired	Married	Low	Urban	No	No	D04
P0692	81	Female	10	Unemployed	Widowed	High	Rural	No	No	D02
P0693	71	Female	2	Unemployed	Married	High	Rural	Yes	No	D04
P0694	51	Male	0	Employed	Single	Medium	Rural	No	No	D01
P0695	66	Male	1	Employed	Widowed	Medium	Urban	Yes	No	D04
P0696	70	Male	4	Retired	Married	Medium	Urban	No	No	D03
P0697	75	Female	14	Retired	Married	High	Rural	Yes	No	D03
P0698	84	Male	17	Employed	Widowed	Low	Urban	No	Yes	D02
P0699	51	Male	14	Retired	Single	Low	Urban	Yes	Yes	D03
P0700	60	Male	19	Retired	Single	Low	Rural	No	Yes	D03
P0701	79	Male	11	Unemployed	Married	Low	Urban	No	Yes	D02
P0702	70	Female	5	Retired	Married	Medium	Rural	No	Yes	D03
P0703	76	Male	5	Employed	Single	Low	Urban	No	Yes	D04
P0704	91	Female	11	Retired	Married	Low	Rural	No	No	D03
P0705	78	Male	4	Unemployed	Single	High	Rural	No	No	D04
P0706	86	Female	18	Retired	Single	Low	Urban	No	No	D04
P0707	76	Female	17	Employed	Married	Medium	Urban	Yes	No	D05
P0708	87	Female	6	Employed	Married	Medium	Urban	Yes	No	D01
P0709	73	Female	13	Unemployed	Widowed	Low	Rural	No	Yes	D05
P0710	82	Male	15	Employed	Widowed	Medium	Rural	No	No	D05
P0711	70	Male	17	Unemployed	Widowed	Low	Urban	Yes	Yes	D03
P0712	55	Female	6	Retired	Single	Medium	Rural	No	No	D05
P0713	54	Female	11	Unemployed	Single	High	Urban	No	No	D03
P0714	60	Female	15	Employed	Single	Low	Rural	Yes	No	D01
P0715	88	Male	18	Employed	Single	Low	Urban	No	No	D05
P0716	82	Male	10	Unemployed	Single	High	Urban	No	No	D05
P0717	63	Female	5	Retired	Married	Medium	Rural	No	No	D01
P0718	82	Male	16	Unemployed	Single	Medium	Urban	No	No	D01
P0719	85	Female	9	Employed	Single	High	Rural	Yes	No	D05
P0720	54	Male	1	Employed	Single	High	Rural	No	No	D03
P0721	64	Male	18	Employed	Single	High	Rural	No	No	D01
P0722	93	Female	8	Employed	Single	High	Rural	No	Yes	D01
P0723	75	Female	8	Retired	Single	Low	Rural	No	No	D02
P0724	52	Male	0	Unemployed	Widowed	High	Urban	No	No	D02
P0725	58	Male	8	Unemployed	Single	Low	Rural	No	No	D04
P0726	51	Female	15	Employed	Single	Low	Urban	No	No	D02
P0727	58	Female	3	Retired	Married	Medium	Urban	Yes	No	D01
P0728	55	Male	7	Retired	Married	Medium	Rural	No	No	D02
P0729	93	Male	17	Unemployed	Single	High	Urban	Yes	No	D03
P0730	64	Male	2	Employed	Married	High	Urban	No	No	D02
P0731	86	Male	16	Unemployed	Single	Medium	Rural	No	Yes	D03
P0732	89	Male	3	Employed	Widowed	High	Rural	No	No	D05
P0733	61	Female	9	Employed	Widowed	Low	Urban	No	No	D02
P0734	61	Male	12	Unemployed	Single	High	Urban	No	Yes	D02
P0735	68	Male	19	Unemployed	Single	High	Urban	No	Yes	D03
P0736	68	Male	11	Retired	Single	High	Urban	No	No	D01
P0737	55	Female	13	Employed	Widowed	Medium	Rural	Yes	Yes	D01
P0738	67	Female	2	Employed	Married	Low	Urban	No	No	D03
P0739	60	Female	19	Retired	Married	High	Rural	Yes	No	D04
P0740	52	Female	11	Employed	Widowed	High	Rural	No	Yes	D02
P0741	56	Female	16	Unemployed	Married	Medium	Urban	No	Yes	D01
P0742	82	Female	0	Employed	Single	Medium	Rural	No	No	D03
P0743	83	Female	3	Employed	Widowed	High	Rural	No	No	D03
P0744	85	Female	8	Employed	Widowed	Medium	Rural	No	No	D02
P0745	58	Male	15	Retired	Widowed	Low	Rural	Yes	No	D02
P0746	59	Male	5	Unemployed	Single	High	Rural	No	No	D02
P0747	68	Female	12	Retired	Married	High	Urban	No	No	D02
P0748	67	Female	18	Employed	Single	High	Urban	Yes	No	D01
P0749	76	Male	11	Retired	Single	Low	Rural	No	Yes	D01
P0750	66	Male	8	Unemployed	Widowed	Medium	Rural	No	Yes	D02
P0751	72	Female	17	Employed	Single	Medium	Urban	Yes	No	D01
P0752	61	Female	1	Employed	Widowed	High	Urban	No	Yes	D03
P0753	94	Female	19	Unemployed	Married	High	Rural	No	No	D05
P0754	91	Female	16	Unemployed	Single	High	Urban	No	Yes	D05
P0755	93	Female	4	Retired	Widowed	High	Rural	Yes	No	D04
P0756	81	Male	14	Unemployed	Widowed	High	Urban	No	No	D04
P0757	65	Female	16	Unemployed	Widowed	High	Urban	No	No	D02
P0758	52	Male	4	Unemployed	Widowed	Low	Urban	No	No	D04
P0759	86	Male	18	Unemployed	Widowed	Medium	Urban	No	Yes	D02
P0760	67	Male	18	Retired	Married	Medium	Urban	No	No	D01
P0761	80	Male	0	Employed	Widowed	Medium	Rural	No	No	D02
P0762	51	Female	6	Employed	Married	High	Urban	Yes	Yes	D05
P0763	90	Female	13	Retired	Single	Medium	Urban	No	No	D02
P0764	50	Female	7	Employed	Married	High	Rural	No	Yes	D05
P0765	85	Female	4	Retired	Widowed	Low	Urban	No	No	D05
P0766	55	Female	1	Unemployed	Widowed	High	Rural	Yes	No	D02
P0767	93	Female	8	Retired	Widowed	High	Urban	Yes	No	D03
P0768	63	Male	2	Retired	Married	Low	Rural	No	No	D03
P0769	89	Female	11	Unemployed	Widowed	Low	Urban	No	Yes	D03
P0770	55	Female	6	Retired	Single	Low	Urban	No	No	D05
P0771	71	Male	19	Employed	Single	High	Rural	Yes	No	D02
P0772	56	Female	17	Unemployed	Widowed	Medium	Rural	No	No	D01
P0773	60	Female	15	Unemployed	Widowed	Low	Urban	No	No	D04
P0774	68	Female	5	Retired	Married	High	Rural	No	No	D05
P0775	58	Male	13	Retired	Widowed	Medium	Urban	No	No	D04
P0776	58	Male	17	Unemployed	Single	Low	Rural	Yes	No	D05
P0777	59	Female	2	Unemployed	Married	Medium	Rural	No	No	D05
P0778	59	Male	9	Unemployed	Widowed	Low	Urban	No	No	D02
P0779	86	Female	17	Retired	Married	Low	Urban	No	Yes	D03
P0780	77	Male	18	Unemployed	Single	High	Urban	No	No	D04
P0781	68	Female	13	Retired	Widowed	Low	Urban	No	Yes	D03
P0782	94	Female	4	Retired	Single	Medium	Urban	No	No	D04
P0783	87	Female	7	Unemployed	Single	High	Urban	No	No	D02
P0784	74	Female	5	Retired	Married	Medium	Urban	No	No	D03
P0785	79	Male	7	Unemployed	Single	High	Rural	No	No	D05
P0786	55	Female	10	Retired	Married	Low	Rural	Yes	No	D05
P0787	73	Female	7	Unemployed	Widowed	Low	Rural	No	No	D05
P0788	87	Female	10	Retired	Married	High	Urban	No	No	D01
P0789	87	Female	8	Employed	Married	Low	Urban	Yes	Yes	D04
P0790	84	Male	3	Employed	Widowed	High	Urban	No	No	D04
P0791	94	Male	3	Employed	Married	High	Rural	No	No	D01
P0792	53	Male	19	Employed	Married	High	Urban	No	No	D04
P0793	67	Female	17	Retired	Married	Medium	Urban	Yes	No	D01
P0794	70	Female	7	Retired	Single	Medium	Rural	Yes	No	D04
P0795	55	Female	2	Unemployed	Married	Medium	Urban	No	Yes	D02
P0796	87	Female	0	Employed	Married	Medium	Urban	No	No	D03
P0797	87	Male	2	Unemployed	Widowed	Medium	Rural	No	No	D03
P0798	77	Female	5	Retired	Widowed	High	Urban	No	No	D05
P0799	84	Female	2	Retired	Married	Medium	Urban	Yes	No	D03
P0800	68	Female	7	Retired	Widowed	Medium	Urban	No	No	D02
P0801	83	Male	8	Retired	Single	High	Urban	No	No	D01
P0802	75	Male	3	Retired	Married	Low	Urban	Yes	No	D04
P0803	59	Male	1	Unemployed	Widowed	Medium	Rural	No	No	D05
P0804	53	Female	11	Retired	Widowed	Medium	Rural	No	No	D05
P0805	92	Male	11	Unemployed	Married	Low	Urban	Yes	No	D05
P0806	54	Male	13	Retired	Single	Low	Rural	Yes	No	D05
P0807	51	Female	13	Retired	Widowed	Medium	Rural	No	Yes	D05
P0808	62	Female	16	Employed	Married	Low	Rural	No	Yes	D01
P0809	77	Female	13	Retired	Married	Low	Rural	No	No	D03
P0810	85	Male	4	Unemployed	Widowed	Medium	Urban	Yes	No	D03
P0811	79	Female	5	Unemployed	Married	High	Urban	No	Yes	D03
P0812	77	Male	16	Employed	Single	High	Urban	Yes	No	D04
P0813	76	Female	14	Employed	Married	High	Urban	No	Yes	D01
P0814	74	Female	17	Unemployed	Widowed	Low	Rural	Yes	No	D02
P0815	53	Female	9	Retired	Married	Medium	Rural	No	No	D02
P0816	62	Female	10	Employed	Married	Medium	Rural	No	No	D01
P0817	80	Female	1	Employed	Widowed	Low	Rural	No	No	D03
P0818	61	Female	18	Unemployed	Single	High	Urban	No	No	D03
P0819	52	Female	1	Employed	Widowed	High	Urban	No	No	D03
P0820	63	Female	18	Employed	Widowed	Low	Rural	No	No	D04
P0821	51	Female	11	Unemployed	Widowed	Medium	Urban	No	No	D02
P0822	93	Male	9	Unemployed	Married	Low	Rural	No	No	D05
P0823	54	Male	10	Retired	Single	High	Rural	Yes	Yes	D02
P0824	90	Male	18	Unemployed	Widowed	Medium	Urban	No	No	D01
P0825	80	Female	15	Employed	Single	High	Urban	No	No	D03
P0826	66	Female	2	Retired	Single	Medium	Urban	Yes	No	D05
P0827	73	Female	7	Retired	Widowed	Medium	Rural	No	No	D04
P0828	76	Male	2	Retired	Single	High	Urban	Yes	No	D02
P0829	75	Female	6	Retired	Single	High	Urban	No	No	D05
P0830	89	Female	5	Unemployed	Married	Low	Rural	No	Yes	D04
P0831	93	Female	8	Employed	Single	High	Rural	Yes	No	D05
P0832	78	Female	15	Employed	Single	Medium	Rural	No	No	D02
P0833	69	Female	19	Unemployed	Single	Medium	Rural	Yes	No	D01
P0834	77	Male	16	Retired	Single	Medium	Urban	No	No	D01
P0835	72	Female	13	Employed	Widowed	Low	Rural	Yes	No	D02
P0836	66	Male	13	Retired	Married	High	Rural	Yes	No	D03
P0837	79	Female	12	Unemployed	Widowed	Medium	Rural	Yes	Yes	D03
P0838	89	Male	11	Unemployed	Widowed	Medium	Rural	Yes	No	D01
P0839	67	Male	1	Unemployed	Married	High	Rural	No	Yes	D03
P0840	76	Female	12	Employed	Married	Low	Urban	No	No	D04
P0841	84	Male	11	Unemployed	Widowed	High	Rural	Yes	No	D02
P0842	94	Female	19	Employed	Single	Medium	Rural	No	No	D04
P0843	79	Female	15	Unemployed	Single	High	Urban	No	No	D04
P0844	56	Female	16	Retired	Widowed	Low	Rural	No	No	D01
P0845	79	Female	12	Employed	Single	Medium	Rural	No	No	D01
P0846	70	Female	9	Retired	Single	Medium	Rural	Yes	No	D01
P0847	92	Male	17	Unemployed	Widowed	Medium	Urban	Yes	No	D01
P0848	58	Female	16	Unemployed	Married	High	Rural	No	No	D04
P0849	86	Female	10	Unemployed	Widowed	Low	Rural	No	No	D05
P0850	72	Female	1	Unemployed	Single	Medium	Urban	No	No	D01
P0851	68	Male	16	Unemployed	Widowed	Low	Rural	No	Yes	D02
P0852	61	Female	16	Retired	Married	High	Urban	No	No	D05
P0853	82	Female	5	Retired	Widowed	Medium	Rural	No	No	D05
P0854	87	Male	4	Retired	Married	High	Rural	No	No	D02
P0855	66	Male	16	Retired	Widowed	Low	Rural	No	No	D05
P0856	90	Female	14	Unemployed	Single	High	Urban	No	Yes	D05
P0857	79	Male	17	Employed	Married	Medium	Rural	No	No	D02
P0858	66	Male	3	Employed	Single	Medium	Rural	Yes	Yes	D01
P0859	94	Female	12	Unemployed	Single	Medium	Urban	No	No	D05
P0860	66	Female	11	Retired	Single	High	Rural	Yes	Yes	D04
P0861	87	Female	2	Retired	Widowed	Low	Rural	No	No	D03
P0862	67	Male	4	Employed	Married	Low	Rural	No	No	D04
P0863	72	Female	7	Employed	Single	Low	Rural	No	No	D02
P0864	69	Male	15	Unemployed	Widowed	Low	Rural	No	No	D01
P0865	66	Female	0	Unemployed	Single	Low	Rural	No	Yes	D03
P0866	70	Male	2	Unemployed	Married	Low	Rural	No	No	D03
P0867	83	Female	4	Retired	Widowed	Low	Rural	Yes	No	D02
P0868	56	Female	15	Employed	Single	High	Rural	No	No	D02
P0869	75	Female	12	Unemployed	Single	Medium	Rural	No	No	D01
P0870	91	Male	3	Employed	Single	Low	Urban	No	No	D03
P0871	78	Female	14	Employed	Single	Medium	Urban	No	No	D03
P0872	61	Female	8	Retired	Married	Low	Urban	No	No	D05
P0873	88	Female	1	Employed	Widowed	Medium	Rural	No	Yes	D04
P0874	90	Male	19	Employed	Widowed	High	Rural	Yes	No	D03
P0875	93	Male	5	Unemployed	Married	Medium	Rural	No	No	D01
P0876	71	Male	15	Retired	Married	Low	Urban	No	No	D04
P0877	82	Female	7	Employed	Married	High	Urban	No	No	D02
P0878	72	Male	16	Retired	Married	High	Rural	Yes	Yes	D03
P0879	58	Female	2	Retired	Single	High	Rural	Yes	Yes	D01
P0880	53	Female	11	Retired	Single	Medium	Rural	Yes	No	D05
P0881	83	Female	16	Unemployed	Married	Medium	Urban	Yes	No	D03
P0882	55	Female	14	Unemployed	Married	High	Rural	Yes	No	D02
P0883	94	Female	0	Unemployed	Married	Low	Urban	No	Yes	D02
P0884	50	Male	5	Retired	Single	High	Rural	Yes	No	D05
P0885	78	Female	19	Retired	Married	Medium	Urban	No	No	D01
P0886	82	Male	17	Retired	Married	High	Urban	No	No	D03
P0887	62	Female	5	Unemployed	Married	Low	Rural	No	No	D03
P0888	56	Male	19	Employed	Married	High	Urban	No	No	D01
P0889	58	Male	16	Unemployed	Married	Medium	Urban	No	Yes	D03
P0890	79	Male	4	Employed	Widowed	Low	Urban	No	No	D05
P0891	85	Female	14	Unemployed	Married	Low	Urban	No	No	D03
P0892	65	Male	3	Retired	Married	High	Urban	Yes	No	D02
P0893	51	Female	11	Retired	Single	Medium	Rural	No	No	D02
P0894	65	Female	0	Employed	Single	Low	Rural	No	No	D04
P0895	94	Male	16	Retired	Married	High	Urban	Yes	No	D04
P0896	59	Female	0	Retired	Widowed	High	Urban	No	Yes	D05
P0897	91	Male	12	Employed	Married	Medium	Urban	No	No	D03
P0898	91	Female	13	Unemployed	Widowed	Low	Rural	No	Yes	D05
P0899	53	Female	14	Retired	Single	High	Urban	Yes	No	D05
P0900	67	Male	2	Unemployed	Single	High	Urban	No	No	D01
P0901	80	Male	18	Retired	Married	Medium	Urban	Yes	No	D01
P0902	67	Female	5	Employed	Married	Medium	Rural	Yes	Yes	D05
P0903	90	Female	3	Retired	Single	Medium	Rural	Yes	No	D05
P0904	55	Female	4	Retired	Widowed	Medium	Rural	No	Yes	D03
P0905	81	Male	2	Employed	Widowed	High	Rural	Yes	No	D03
P0906	83	Male	7	Unemployed	Widowed	High	Rural	No	No	D05
P0907	50	Male	9	Unemployed	Married	High	Rural	No	No	D02
P0908	71	Male	5	Employed	Married	Medium	Urban	No	No	D01
P0909	67	Female	7	Employed	Widowed	Low	Urban	No	No	D05
P0910	64	Female	15	Employed	Single	High	Rural	No	No	D03
P0911	66	Female	13	Unemployed	Married	Medium	Urban	Yes	No	D03
P0912	56	Female	1	Unemployed	Single	Low	Rural	No	No	D02
P0913	92	Male	16	Retired	Single	High	Urban	Yes	No	D03
P0914	91	Female	3	Unemployed	Single	Low	Urban	No	Yes	D03
P0915	55	Male	15	Retired	Married	High	Rural	Yes	No	D02
P0916	91	Female	15	Unemployed	Single	Medium	Rural	No	No	D05
P0917	56	Female	3	Retired	Widowed	Medium	Urban	Yes	Yes	D01
P0918	65	Female	4	Employed	Single	Low	Urban	Yes	Yes	D05
P0919	85	Male	19	Retired	Married	High	Urban	No	No	D03
P0920	59	Male	9	Employed	Widowed	High	Urban	Yes	No	D04
P0921	68	Female	14	Unemployed	Married	Low	Urban	Yes	No	D03
P0922	55	Male	16	Retired	Widowed	Medium	Urban	No	No	D03
P0923	52	Male	4	Unemployed	Single	High	Urban	Yes	No	D03
P0924	81	Female	11	Employed	Married	Low	Urban	Yes	No	D03
P0925	55	Female	11	Employed	Single	Low	Urban	Yes	No	D03
P0926	69	Male	18	Unemployed	Single	Low	Rural	No	No	D04
P0927	73	Male	11	Retired	Single	Medium	Urban	No	No	D01
P0928	71	Female	19	Employed	Married	Medium	Rural	No	No	D01
P0929	75	Male	14	Unemployed	Single	Medium	Urban	No	No	D04
P0930	87	Male	18	Retired	Widowed	Low	Rural	No	No	D04
P0931	72	Female	11	Unemployed	Widowed	Medium	Rural	No	No	D05
P0932	55	Male	3	Retired	Married	High	Rural	No	No	D02
P0933	81	Male	5	Employed	Widowed	High	Urban	No	No	D01
P0934	74	Female	6	Unemployed	Widowed	High	Urban	No	No	D05
P0935	66	Male	1	Retired	Married	High	Rural	Yes	No	D02
P0936	77	Male	3	Employed	Married	Low	Urban	No	No	D05
P0937	76	Male	1	Employed	Widowed	Low	Rural	No	No	D03
P0938	62	Female	9	Retired	Married	Medium	Rural	No	No	D04
P0939	57	Female	2	Employed	Married	High	Rural	No	No	D04
P0940	60	Male	17	Unemployed	Single	Low	Urban	No	No	D01
P0941	68	Female	19	Employed	Widowed	High	Rural	No	No	D01
P0942	94	Female	13	Retired	Widowed	Medium	Rural	Yes	Yes	D02
P0943	62	Male	16	Employed	Single	Medium	Urban	No	No	D01
P0944	72	Female	2	Employed	Married	Low	Urban	No	No	D01
P0945	55	Female	5	Retired	Widowed	Medium	Urban	Yes	No	D05
P0946	56	Female	6	Unemployed	Married	Medium	Urban	No	No	D04
P0947	64	Male	2	Retired	Married	High	Urban	No	No	D05
P0948	63	Male	6	Employed	Widowed	Low	Rural	No	No	D01
P0949	51	Female	0	Unemployed	Widowed	Low	Rural	Yes	No	D03
P0950	76	Male	3	Retired	Single	Medium	Rural	No	Yes	D01
P0951	90	Male	15	Retired	Widowed	High	Urban	No	No	D04
P0952	53	Male	9	Unemployed	Single	High	Rural	No	No	D02
P0953	93	Female	19	Retired	Widowed	Medium	Urban	No	Yes	D01
P0954	84	Female	10	Retired	Widowed	High	Urban	Yes	No	D03
P0955	85	Male	6	Employed	Widowed	Low	Urban	Yes	No	D03
P0956	79	Female	14	Employed	Widowed	Medium	Rural	Yes	No	D01
P0957	94	Female	19	Retired	Single	Low	Urban	No	Yes	D03
P0958	69	Male	2	Employed	Single	High	Rural	No	No	D01
P0959	80	Male	9	Employed	Widowed	High	Urban	No	No	D04
P0960	71	Female	5	Unemployed	Single	High	Rural	No	Yes	D01
P0961	73	Female	18	Employed	Widowed	High	Urban	No	No	D02
P0962	58	Male	8	Retired	Single	High	Rural	No	No	D03
P0963	51	Male	17	Employed	Married	Low	Urban	No	No	D02
P0964	51	Male	10	Unemployed	Married	Medium	Rural	No	No	D05
P0965	69	Male	11	Retired	Widowed	High	Urban	Yes	No	D02
P0966	85	Female	16	Retired	Widowed	Medium	Urban	Yes	Yes	D04
P0967	58	Male	6	Retired	Widowed	Low	Rural	Yes	No	D04
P0968	75	Female	15	Retired	Widowed	Low	Urban	Yes	Yes	D03
P0969	52	Male	16	Retired	Widowed	High	Rural	Yes	No	D04
P0970	70	Female	5	Unemployed	Single	High	Rural	No	No	D05
P0971	54	Female	6	Retired	Married	High	Urban	Yes	No	D05
P0972	82	Female	6	Employed	Married	Low	Rural	Yes	No	D04
P0973	58	Female	4	Employed	Widowed	High	Urban	Yes	No	D04
P0974	92	Male	9	Unemployed	Single	Medium	Urban	Yes	No	D04
P0975	79	Female	3	Employed	Widowed	Low	Urban	Yes	No	D05
P0976	77	Female	18	Employed	Married	High	Urban	No	No	D03
P0977	73	Male	6	Unemployed	Single	High	Urban	Yes	No	D01
P0978	64	Male	13	Unemployed	Widowed	Medium	Urban	Yes	Yes	D01
P0979	73	Male	8	Retired	Married	High	Rural	No	No	D02
P0980	92	Female	3	Employed	Married	High	Rural	No	No	D02
P0981	56	Male	4	Retired	Widowed	High	Urban	No	No	D01
P0982	64	Male	0	Unemployed	Married	Low	Urban	No	No	D04
P0983	59	Male	9	Unemployed	Widowed	Medium	Urban	No	No	D01
P0984	60	Male	12	Retired	Single	High	Urban	No	Yes	D02
P0985	65	Male	5	Employed	Single	High	Urban	No	No	D01
P0986	54	Male	18	Retired	Widowed	Low	Urban	No	No	D01
P0987	64	Female	5	Retired	Widowed	Low	Urban	No	No	D01
P0988	60	Female	0	Retired	Single	Low	Urban	No	Yes	D05
P0989	64	Male	10	Retired	Married	Low	Rural	No	No	D03
P0990	62	Female	15	Employed	Widowed	Medium	Rural	No	No	D05
P0991	87	Female	14	Employed	Married	Medium	Rural	No	No	D03
P0992	50	Female	17	Unemployed	Single	High	Rural	No	No	D01
P0993	54	Male	6	Retired	Widowed	Medium	Urban	No	Yes	D02
P0994	72	Male	14	Retired	Single	Low	Urban	Yes	Yes	D01
P0995	68	Female	2	Retired	Single	Low	Rural	Yes	No	D03
P0996	52	Male	15	Unemployed	Married	Low	Rural	No	No	D03
P0997	69	Female	0	Retired	Single	Medium	Urban	No	No	D01
P0998	75	Female	10	Unemployed	Married	Low	Urban	Yes	No	D03
P0999	52	Female	7	Unemployed	Single	Medium	Rural	No	No	D02
P1000	62	Female	16	Employed	Married	Medium	Urban	No	No	D02
\.


--
-- TOC entry 3701 (class 0 OID 16491)
-- Dependencies: 220
-- Data for Name: patienttest; Type: TABLE DATA; Schema: public; Owner: dadb
--

COPY public.patienttest (visit_id, bmi, diabetes, hypertension, cholesterol_level, cognitive_test_score) FROM stdin;
V0001	30.1	Yes	No	Normal	34
V0002	32.5	No	No	Normal	60
V0003	27.1	No	No	Normal	62
V0004	27.7	No	No	High	95
V0005	22.4	No	No	Normal	42
V0006	30.7	No	Yes	Normal	67
V0007	26.9	No	No	Normal	66
V0008	31.4	Yes	No	Normal	70
V0009	29	No	Yes	Normal	51
V0010	34.4	No	No	High	37
V0011	25.3	No	No	High	71
V0012	24.8	No	No	High	41
V0013	21.5	No	No	Normal	31
V0014	31.7	No	No	Normal	30
V0015	27.3	No	Yes	Normal	47
V0016	25.8	Yes	No	Normal	59
V0017	30	No	No	High	61
V0018	33.2	No	No	Normal	50
V0019	30.9	No	No	Normal	36
V0020	34.9	No	No	Normal	41
V0021	22.3	No	Yes	Normal	77
V0022	28.2	No	No	High	83
V0023	31.8	No	No	High	98
V0024	21.1	No	No	Normal	44
V0025	20.4	No	No	Normal	94
V0026	33	Yes	No	Normal	42
V0027	19.5	Yes	No	Normal	64
V0028	34	No	No	Normal	92
V0029	26.1	Yes	No	High	64
V0030	22.3	No	No	Normal	40
V0031	33.9	No	No	High	43
V0032	23.6	No	No	Normal	44
V0033	33.8	No	Yes	High	55
V0034	29.2	No	No	Normal	89
V0035	32.3	No	Yes	Normal	70
V0036	20.3	Yes	Yes	Normal	54
V0037	26.9	Yes	Yes	Normal	93
V0038	34.8	Yes	No	High	67
V0039	20.5	No	No	Normal	51
V0040	31.6	No	No	Normal	85
V0041	26.3	No	No	High	95
V0042	25.6	Yes	No	Normal	74
V0043	26.1	No	No	Normal	49
V0044	33.9	No	Yes	Normal	83
V0045	30.8	Yes	Yes	High	68
V0046	24.6	No	No	Normal	67
V0047	21.2	No	Yes	High	82
V0048	20	No	No	Normal	45
V0049	30	No	No	Normal	73
V0050	20.4	No	No	Normal	47
V0051	18.7	No	Yes	Normal	57
V0052	21	No	No	High	56
V0053	23.5	Yes	Yes	Normal	51
V0054	32.1	No	No	High	88
V0055	21.6	Yes	No	Normal	69
V0056	33.4	Yes	Yes	Normal	80
V0057	27.7	No	Yes	Normal	78
V0058	22.2	No	No	Normal	62
V0059	25.2	No	No	High	99
V0060	18.9	No	No	High	81
V0061	26.2	No	Yes	Normal	43
V0062	20.4	Yes	No	Normal	66
V0063	20.3	No	Yes	High	37
V0064	22.5	No	No	High	65
V0065	21	No	No	Normal	53
V0066	28.8	No	No	Normal	97
V0067	23.7	No	No	Normal	62
V0068	21.8	Yes	No	Normal	73
V0069	25.2	No	No	Normal	86
V0070	24.4	No	Yes	High	95
V0071	22.2	No	Yes	Normal	85
V0072	27.6	No	No	Normal	39
V0073	25.3	Yes	No	Normal	80
V0074	32.1	No	No	Normal	41
V0075	20.1	No	No	Normal	79
V0076	30.6	No	Yes	Normal	38
V0077	28.1	No	No	Normal	43
V0078	19.1	No	Yes	High	41
V0079	19.3	No	No	Normal	41
V0080	26.6	Yes	Yes	High	78
V0081	22.9	No	No	Normal	51
V0082	28.2	No	No	Normal	50
V0083	20.3	No	No	High	77
V0084	30.5	No	No	Normal	50
V0085	35	No	No	Normal	83
V0086	33.5	No	No	High	34
V0087	21.6	No	No	High	67
V0088	20.6	No	No	High	85
V0089	30.3	No	No	High	89
V0090	27.9	No	No	Normal	81
V0091	22.8	No	No	Normal	44
V0092	22.4	Yes	No	Normal	60
V0093	34.1	No	No	Normal	67
V0094	29.4	Yes	No	Normal	75
V0095	33.3	No	Yes	Normal	81
V0096	21.3	No	No	High	93
V0097	19.4	No	No	Normal	74
V0098	28.4	Yes	No	Normal	93
V0099	24.2	No	No	Normal	74
V0100	29.2	No	No	Normal	80
V0101	24.2	No	No	Normal	42
V0102	22	Yes	Yes	Normal	91
V0103	30.1	No	No	Normal	58
V0104	28.3	No	Yes	Normal	73
V0105	34.7	No	No	Normal	46
V0106	27.4	No	No	High	79
V0107	32.1	No	Yes	Normal	34
V0108	27.6	Yes	No	High	35
V0109	20.3	No	No	High	92
V0110	31.5	No	No	Normal	36
V0111	32.7	No	No	Normal	59
V0112	19.2	No	No	Normal	65
V0113	21.1	No	No	High	44
V0114	26.9	No	Yes	Normal	65
V0115	23.2	No	Yes	Normal	91
V0116	25.9	No	Yes	Normal	65
V0117	26.9	No	Yes	Normal	39
V0118	34.8	No	No	Normal	34
V0119	26.7	No	No	Normal	94
V0120	26.7	No	Yes	High	67
V0121	20.2	No	Yes	High	83
V0122	19.4	No	No	High	67
V0123	29.2	No	Yes	Normal	30
V0124	26.6	No	No	Normal	76
V0125	26.8	Yes	No	Normal	74
V0126	30.7	No	No	Normal	45
V0127	20.9	No	No	High	83
V0128	22.7	No	Yes	High	76
V0129	30.3	No	No	High	71
V0130	31.5	No	No	High	63
V0131	35	No	No	Normal	51
V0132	26.1	No	No	Normal	44
V0133	31.8	No	No	Normal	88
V0134	27.2	Yes	No	Normal	76
V0135	27.8	No	No	Normal	79
V0136	27.6	No	No	Normal	44
V0137	32.1	No	Yes	Normal	84
V0138	21.5	No	Yes	Normal	65
V0139	23.4	No	Yes	Normal	63
V0140	27.6	No	No	Normal	84
V0141	26.7	No	No	Normal	82
V0142	19.3	No	No	High	32
V0143	30.2	No	Yes	Normal	50
V0144	22.3	Yes	Yes	Normal	32
V0145	23.4	No	Yes	High	91
V0146	23.3	No	No	High	67
V0147	21.4	No	No	Normal	50
V0148	31.2	No	No	High	94
V0149	19.4	No	No	Normal	74
V0150	32.6	No	No	High	78
V0151	28.4	No	No	High	69
V0152	18.9	No	No	High	88
V0153	19.9	Yes	No	Normal	52
V0154	30.5	No	No	Normal	44
V0155	30.6	No	No	Normal	67
V0156	21.8	No	Yes	Normal	55
V0157	26.4	No	Yes	High	86
V0158	25.2	Yes	Yes	Normal	42
V0159	28.7	No	No	High	52
V0160	31	No	Yes	Normal	94
V0161	26.5	No	Yes	High	51
V0162	22.3	No	No	Normal	89
V0163	33	No	Yes	Normal	91
V0164	21.9	No	No	Normal	71
V0165	19	No	No	Normal	79
V0166	29.9	Yes	No	Normal	66
V0167	21.9	Yes	No	Normal	38
V0168	28.6	No	No	Normal	86
V0169	28.9	No	No	Normal	45
V0170	34.8	No	No	Normal	72
V0171	26.1	No	Yes	Normal	57
V0172	26.2	No	Yes	Normal	59
V0173	23.5	Yes	No	Normal	70
V0174	33.4	No	No	Normal	46
V0175	25.9	No	No	Normal	59
V0176	28.6	No	Yes	High	63
V0177	32.7	No	No	High	80
V0178	31.7	No	Yes	Normal	50
V0179	22.5	Yes	Yes	Normal	73
V0180	28.7	No	No	High	59
V0181	19	No	Yes	Normal	34
V0182	20.3	Yes	No	High	52
V0183	19.5	No	No	High	94
V0184	26.1	Yes	No	High	94
V0185	22	No	No	Normal	81
V0186	25.6	No	No	High	77
V0187	19.9	No	No	Normal	60
V0188	34.2	No	No	Normal	43
V0189	30.7	Yes	No	High	80
V0190	26.7	No	Yes	Normal	91
V0191	18.9	No	Yes	Normal	40
V0192	31.7	No	Yes	Normal	56
V0193	31.3	Yes	Yes	High	49
V0194	25.1	No	Yes	Normal	55
V0195	29.5	No	No	Normal	64
V0196	29.3	No	No	Normal	71
V0197	23.4	Yes	Yes	Normal	41
V0198	25	Yes	No	Normal	75
V0199	20.7	No	Yes	Normal	58
V0200	20.8	No	No	High	87
V0201	33.1	No	No	Normal	91
V0202	32.7	Yes	Yes	Normal	88
V0203	30.4	No	Yes	High	87
V0204	30.8	No	No	High	56
V0205	21.8	No	No	Normal	36
V0206	22.1	No	No	Normal	51
V0207	31.8	No	No	High	70
V0208	34.7	No	No	Normal	61
V0209	26.5	No	No	Normal	48
V0210	20	No	No	High	93
V0211	23.5	No	No	Normal	60
V0212	27.6	No	Yes	High	47
V0213	31.5	No	No	Normal	81
V0214	23.8	No	No	Normal	82
V0215	20.9	No	No	High	65
V0216	28.8	No	No	Normal	39
V0217	21.7	No	Yes	High	95
V0218	34.9	No	No	Normal	65
V0219	31.3	No	Yes	High	39
V0220	25.3	No	No	Normal	99
V0221	23.6	No	No	Normal	78
V0222	31.3	No	Yes	Normal	42
V0223	18.9	No	No	Normal	87
V0224	19.5	No	No	High	51
V0225	27.6	No	No	High	60
V0226	22.3	Yes	No	High	87
V0227	21.5	No	No	High	40
V0228	30.4	No	No	Normal	66
V0229	33.6	No	No	High	80
V0230	21.5	No	Yes	High	70
V0231	27.1	No	No	Normal	63
V0232	23.2	No	Yes	High	62
V0233	26.6	Yes	No	Normal	30
V0234	21.6	No	No	High	98
V0235	26.1	No	No	Normal	66
V0236	34.3	No	No	Normal	49
V0237	22.2	No	Yes	Normal	38
V0238	30.6	No	No	Normal	53
V0239	21.3	No	Yes	Normal	61
V0240	29.4	No	No	High	60
V0241	19.4	No	Yes	High	88
V0242	19.2	No	No	High	49
V0243	21.3	No	No	Normal	79
V0244	22.7	No	Yes	Normal	82
V0245	26.4	No	No	Normal	54
V0246	29.7	No	No	High	55
V0247	32.7	No	No	Normal	95
V0248	23.5	No	No	High	40
V0249	22.7	Yes	Yes	Normal	40
V0250	26.3	Yes	No	Normal	56
V0251	27	Yes	No	Normal	38
V0252	25.5	Yes	No	Normal	53
V0253	20.7	No	No	Normal	61
V0254	34.4	No	Yes	Normal	37
V0255	33.1	Yes	No	Normal	92
V0256	27.5	Yes	Yes	Normal	75
V0257	20.7	No	No	Normal	61
V0258	29.5	No	No	High	41
V0259	26.8	Yes	No	Normal	37
V0260	24.1	No	No	High	47
V0261	30.3	No	No	Normal	88
V0262	32.1	No	Yes	Normal	98
V0263	20.1	No	Yes	High	67
V0264	29.1	No	Yes	High	53
V0265	26.5	No	No	Normal	54
V0266	29.7	No	No	Normal	30
V0267	29.7	No	Yes	Normal	94
V0268	21.6	No	Yes	High	79
V0269	28.4	No	No	Normal	35
V0270	20.7	No	No	Normal	41
V0271	32.3	No	No	Normal	36
V0272	34.7	No	No	High	93
V0273	32.4	No	No	High	36
V0274	30.8	No	No	Normal	97
V0275	29.2	No	No	High	87
V0276	23.7	No	Yes	Normal	60
V0277	22	Yes	No	Normal	90
V0278	29.9	No	Yes	Normal	83
V0279	23.7	No	No	Normal	40
V0280	32.9	Yes	Yes	High	45
V0281	25.9	No	No	High	33
V0282	23.5	No	No	High	82
V0283	21.3	Yes	Yes	Normal	53
V0284	28.7	No	No	Normal	31
V0285	19.2	No	Yes	High	69
V0286	28.5	No	No	Normal	85
V0287	34.3	No	No	Normal	30
V0288	32.5	No	No	Normal	40
V0289	18.8	No	Yes	Normal	55
V0290	31.1	No	No	Normal	60
V0291	28.7	No	Yes	Normal	72
V0292	34.1	No	No	Normal	70
V0293	25	No	No	Normal	40
V0294	19	Yes	No	Normal	77
V0295	25.9	No	No	Normal	39
V0296	26.7	No	No	High	64
V0297	32	No	No	High	59
V0298	29	No	Yes	Normal	91
V0299	30.6	No	No	Normal	38
V0300	28.3	Yes	No	Normal	46
V0301	32.7	No	No	Normal	71
V0302	31.2	No	Yes	Normal	87
V0303	26.8	No	Yes	Normal	93
V0304	31.8	No	No	High	98
V0305	32.3	Yes	No	Normal	57
V0306	21.5	No	Yes	Normal	82
V0307	25.9	No	No	High	92
V0308	20.3	No	Yes	Normal	62
V0309	28	No	No	High	75
V0310	28.7	No	No	Normal	33
V0311	30.8	No	No	Normal	67
V0312	33.7	Yes	No	Normal	42
V0313	20.1	Yes	Yes	Normal	94
V0314	29.6	No	No	High	62
V0315	20.9	No	No	Normal	62
V0316	19.9	No	No	Normal	50
V0317	27.8	No	Yes	Normal	34
V0318	25.3	No	No	Normal	67
V0319	24.4	No	No	High	79
V0320	31.4	Yes	No	Normal	84
V0321	24	No	Yes	Normal	74
V0322	26.6	No	No	Normal	97
V0323	31.6	No	No	Normal	94
V0324	25.9	No	Yes	High	52
V0325	18.8	No	No	High	33
V0326	30	No	No	Normal	86
V0327	32.3	No	No	High	80
V0328	32.6	No	No	Normal	93
V0329	19.1	No	No	High	69
V0330	21.3	No	Yes	Normal	89
V0331	23.8	No	No	Normal	81
V0332	20.9	No	No	Normal	40
V0333	24	No	No	Normal	56
V0334	33.1	Yes	No	High	50
V0335	32.8	No	Yes	Normal	78
V0336	28.9	Yes	No	Normal	37
V0337	20.5	No	No	Normal	49
V0338	28.1	No	No	Normal	62
V0339	27.9	No	No	Normal	68
V0340	24	Yes	No	Normal	30
V0341	34.2	No	No	Normal	55
V0342	32.3	No	No	High	66
V0343	28	No	No	Normal	81
V0344	23.7	No	No	Normal	84
V0345	23.4	No	No	Normal	58
V0346	34.3	No	Yes	High	67
V0347	23.1	No	No	High	50
V0348	30.8	No	Yes	High	76
V0349	33.8	No	No	Normal	46
V0350	18.9	No	No	High	57
V0351	26.6	No	No	High	89
V0352	32.5	Yes	No	Normal	48
V0353	28.4	No	No	High	48
V0354	30.2	No	Yes	Normal	47
V0355	23.5	Yes	No	Normal	55
V0356	25.9	Yes	No	Normal	56
V0357	27.1	Yes	No	High	91
V0358	26.5	No	No	High	86
V0359	19.6	No	No	Normal	65
V0360	21.5	No	No	Normal	90
V0361	30.6	No	No	High	87
V0362	26.4	No	No	Normal	32
V0363	30.6	No	No	Normal	54
V0364	28.8	No	Yes	Normal	56
V0365	19.7	No	No	High	83
V0366	34.8	No	Yes	Normal	93
V0367	29	Yes	No	High	50
V0368	31.7	Yes	No	High	52
V0369	35	No	Yes	High	49
V0370	34.6	No	No	Normal	62
V0371	34.1	No	No	Normal	40
V0372	18.6	No	No	Normal	48
V0373	21.4	No	No	Normal	50
V0374	33.8	No	No	Normal	61
V0375	23.5	No	No	High	93
V0376	28.2	No	No	Normal	35
V0377	33.8	Yes	No	High	67
V0378	24.1	No	No	High	41
V0379	33.7	No	No	High	51
V0380	19.4	Yes	No	Normal	32
V0381	26.2	No	No	Normal	56
V0382	27.8	Yes	Yes	High	44
V0383	26.2	No	No	Normal	51
V0384	21.5	Yes	Yes	Normal	63
V0385	25.5	Yes	No	Normal	46
V0386	20.5	Yes	No	High	57
V0387	26.6	No	No	Normal	30
V0388	19.5	No	No	High	64
V0389	34.7	No	Yes	Normal	57
V0390	24.3	Yes	Yes	Normal	89
V0391	21	Yes	No	Normal	34
V0392	19.5	No	No	Normal	65
V0393	28.8	No	No	High	44
V0394	30.7	No	Yes	High	31
V0395	19.2	No	Yes	Normal	53
V0396	20.1	Yes	No	Normal	88
V0397	22.5	No	No	High	44
V0398	18.9	No	Yes	Normal	37
V0399	31.4	No	Yes	Normal	35
V0400	24.7	No	Yes	Normal	49
V0401	28.7	No	No	High	49
V0402	34.7	Yes	No	Normal	74
V0403	23.1	No	No	Normal	75
V0404	29.2	No	No	Normal	34
V0405	33.2	Yes	Yes	High	60
V0406	32.9	Yes	No	Normal	80
V0407	31	No	No	Normal	63
V0408	32.4	No	No	High	75
V0409	26.3	Yes	No	Normal	62
V0410	27.7	No	No	High	88
V0411	29.2	No	No	Normal	38
V0412	24.5	No	No	Normal	47
V0413	21.1	No	No	Normal	52
V0414	19.7	No	No	High	31
V0415	22.4	No	No	High	82
V0416	19.1	Yes	Yes	Normal	99
V0417	27.9	No	Yes	High	54
V0418	33.1	Yes	No	High	68
V0419	31.6	No	No	Normal	41
V0420	21.3	No	No	Normal	79
V0421	20.9	No	Yes	Normal	93
V0422	31.9	No	Yes	High	83
V0423	28.4	No	No	Normal	99
V0424	21.2	No	No	Normal	66
V0425	30	No	No	Normal	99
V0426	25.3	No	Yes	Normal	98
V0427	18.8	No	Yes	Normal	96
V0428	20.6	Yes	No	High	51
V0429	33.2	Yes	No	Normal	66
V0430	30	No	No	Normal	50
V0431	28.8	No	No	Normal	82
V0432	32	No	No	High	62
V0433	20.7	Yes	No	Normal	48
V0434	26.7	No	Yes	Normal	41
V0435	21.6	No	No	Normal	44
V0436	25.5	Yes	No	Normal	36
V0437	25.4	No	Yes	High	39
V0438	30.2	No	No	Normal	69
V0439	31.8	No	No	Normal	43
V0440	23.4	Yes	No	Normal	77
V0441	28.3	No	No	Normal	92
V0442	24.6	No	No	Normal	90
V0443	33.1	No	No	Normal	32
V0444	26.7	No	No	High	47
V0445	31.9	No	No	Normal	60
V0446	25.3	No	No	Normal	38
V0447	18.6	No	Yes	High	34
V0448	24.6	No	No	Normal	91
V0449	21.6	No	No	Normal	56
V0450	33.4	Yes	No	High	60
V0451	20.1	No	No	Normal	74
V0452	29.8	No	No	Normal	93
V0453	19.8	No	No	High	51
V0454	31.6	No	No	Normal	43
V0455	27.6	No	Yes	Normal	88
V0456	25.7	Yes	No	High	67
V0457	32.6	No	Yes	High	57
V0458	31.9	Yes	Yes	Normal	63
V0459	32.2	No	No	High	65
V0460	23	No	No	Normal	33
V0461	19.1	No	No	High	63
V0462	22.1	No	No	Normal	31
V0463	33.6	No	No	High	70
V0464	25.2	Yes	No	High	34
V0465	26.1	Yes	Yes	Normal	56
V0466	20.2	Yes	No	High	48
V0467	29.4	No	No	High	68
V0468	19.1	Yes	No	High	48
V0469	28.4	No	No	Normal	36
V0470	31.1	No	No	Normal	89
V0471	31.3	No	Yes	Normal	40
V0472	24.3	No	No	Normal	97
V0473	29.7	Yes	No	Normal	67
V0474	33	No	No	High	53
V0475	29	No	No	High	93
V0476	26.3	No	Yes	High	55
V0477	31.1	No	Yes	Normal	54
V0478	30	No	Yes	Normal	51
V0479	34.3	No	No	High	98
V0480	22.4	No	Yes	Normal	98
V0481	29	No	No	High	75
V0482	23.8	Yes	No	Normal	52
V0483	32.1	No	Yes	High	90
V0484	28.1	No	No	High	62
V0485	28.1	No	No	Normal	35
V0486	30.2	Yes	Yes	Normal	52
V0487	30.9	No	No	Normal	42
V0488	27.6	No	Yes	Normal	37
V0489	28.4	Yes	No	Normal	50
V0490	23.7	No	No	High	94
V0491	24.5	No	No	High	64
V0492	34.5	No	No	Normal	54
V0493	30.9	No	No	Normal	82
V0494	34.4	No	Yes	High	38
V0495	23.4	No	Yes	Normal	51
V0496	22.8	No	No	Normal	31
V0497	29	Yes	No	High	90
V0498	23.9	No	No	High	72
V0499	24.6	No	No	Normal	56
V0500	28.2	Yes	No	High	91
V0501	33.6	Yes	No	Normal	67
V0502	31.3	Yes	No	Normal	58
V0503	34.5	No	Yes	Normal	68
V0504	34.7	No	No	Normal	53
V0505	34.1	No	Yes	Normal	56
V0506	27.9	Yes	No	High	39
V0507	21.9	No	Yes	Normal	35
V0508	19	No	Yes	Normal	68
V0509	26.7	Yes	No	Normal	47
V0510	30.7	No	Yes	Normal	90
V0511	35	Yes	No	Normal	51
V0512	21.2	Yes	No	Normal	75
V0513	27.8	Yes	No	High	75
V0514	23.3	No	No	Normal	35
V0515	24.7	No	Yes	High	46
V0516	27.9	No	No	Normal	89
V0517	18.6	No	No	High	83
V0518	30.8	No	No	Normal	98
V0519	24.2	Yes	No	Normal	64
V0520	27.3	No	No	High	49
V0521	32.2	No	No	Normal	96
V0522	24.6	Yes	No	Normal	57
V0523	29.1	No	No	Normal	88
V0524	19.9	No	No	High	35
V0525	20.1	No	No	Normal	60
V0526	30.2	No	No	High	65
V0527	24.7	No	No	Normal	93
V0528	34.1	Yes	No	Normal	70
V0529	29.4	No	No	Normal	85
V0530	27.8	No	No	Normal	59
V0531	21	No	No	High	77
V0532	30.9	No	Yes	Normal	85
V0533	29.5	Yes	No	Normal	79
V0534	21.3	No	No	Normal	75
V0535	34.1	Yes	No	Normal	82
V0536	22.3	Yes	Yes	Normal	64
V0537	31.1	No	Yes	Normal	74
V0538	19.3	No	No	Normal	42
V0539	27.6	No	No	Normal	41
V0540	24.7	Yes	Yes	High	47
V0541	27.5	No	No	High	41
V0542	34.4	No	No	High	84
V0543	21.9	Yes	Yes	Normal	47
V0544	26.4	No	No	Normal	52
V0545	29.6	No	No	High	71
V0546	23.1	No	No	Normal	67
V0547	23.8	No	No	Normal	35
V0548	33.6	No	No	Normal	72
V0549	19.6	No	No	Normal	52
V0550	21	Yes	No	Normal	80
V0551	22.2	No	No	Normal	97
V0552	26.3	No	No	Normal	42
V0553	29	No	No	Normal	81
V0554	25.6	No	No	Normal	87
V0555	34	No	No	Normal	40
V0556	25.4	Yes	No	Normal	66
V0557	26.9	No	Yes	Normal	36
V0558	24.5	No	Yes	High	59
V0559	26.5	No	No	Normal	95
V0560	20	No	No	Normal	34
V0561	21.5	No	No	High	48
V0562	32.5	No	No	Normal	67
V0563	25.4	No	No	Normal	67
V0564	31.3	No	Yes	Normal	91
V0565	19.4	No	No	High	45
V0566	32	No	Yes	Normal	81
V0567	23.6	No	Yes	Normal	53
V0568	26.5	No	No	High	62
V0569	27.8	No	Yes	High	91
V0570	24	Yes	No	Normal	39
V0571	22.8	No	No	High	94
V0572	19.9	Yes	No	Normal	86
V0573	32.9	No	No	Normal	72
V0574	30.6	Yes	No	High	35
V0575	29	No	No	Normal	52
V0576	23.6	No	No	Normal	77
V0577	27.8	No	Yes	Normal	33
V0578	35	No	No	Normal	45
V0579	20	No	No	Normal	62
V0580	34.1	No	Yes	Normal	58
V0581	20.5	No	Yes	Normal	69
V0582	34.2	Yes	No	High	66
V0583	31.6	No	Yes	Normal	61
V0584	26.9	No	Yes	High	55
V0585	32.5	No	No	Normal	95
V0586	29.8	No	No	Normal	54
V0587	26	No	Yes	Normal	60
V0588	32.8	Yes	Yes	Normal	51
V0589	20	No	No	High	65
V0590	30.8	No	No	Normal	74
V0591	21.7	Yes	Yes	Normal	55
V0592	25.9	No	No	High	83
V0593	26.8	No	No	Normal	80
V0594	28.8	No	Yes	Normal	59
V0595	24.8	No	Yes	Normal	35
V0596	25.3	No	No	High	54
V0597	19.9	No	Yes	Normal	90
V0598	20.3	No	No	High	42
V0599	31.6	No	No	Normal	79
V0600	29.1	No	Yes	Normal	66
V0601	25	No	No	High	64
V0602	23.8	No	Yes	High	48
V0603	26.4	No	No	High	46
V0604	25.6	No	Yes	High	83
V0605	23.4	No	No	High	67
V0606	18.9	No	No	High	64
V0607	33.4	No	No	High	54
V0608	21.2	No	No	Normal	88
V0609	33.2	Yes	Yes	Normal	64
V0610	30.2	No	No	Normal	93
V0611	32.9	No	No	High	96
V0612	34.3	No	Yes	High	74
V0613	25	No	No	High	94
V0614	19.4	No	No	Normal	83
V0615	28	No	No	High	70
V0616	33.9	Yes	No	Normal	60
V0617	24.8	No	No	Normal	87
V0618	20.8	No	Yes	Normal	35
V0619	24.9	No	No	Normal	39
V0620	34.8	No	Yes	High	79
V0621	26.4	No	No	Normal	99
V0622	33.6	No	No	High	93
V0623	27.5	Yes	Yes	High	43
V0624	29.1	No	No	Normal	63
V0625	24.8	No	No	Normal	92
V0626	28.9	Yes	No	High	82
V0627	33.2	No	Yes	Normal	50
V0628	26.2	No	Yes	High	54
V0629	32.9	No	No	Normal	57
V0630	26.6	No	No	High	58
V0631	32.9	No	No	High	85
V0632	28.8	No	Yes	High	45
V0633	24.1	No	Yes	High	39
V0634	22.1	No	No	Normal	32
V0635	22.7	No	No	High	68
V0636	26.9	No	No	High	38
V0637	24.1	No	No	Normal	61
V0638	24.5	No	No	Normal	94
V0639	18.9	No	No	High	33
V0640	33.7	No	Yes	High	64
V0641	19.9	No	No	Normal	30
V0642	30.6	No	No	Normal	92
V0643	29.6	No	No	High	49
V0644	27	No	Yes	Normal	88
V0645	28.7	No	Yes	Normal	83
V0646	21.3	No	No	Normal	69
V0647	32.7	No	Yes	Normal	91
V0648	26.7	No	No	High	45
V0649	31.3	Yes	Yes	Normal	49
V0650	20	No	Yes	High	48
V0651	32.2	No	No	High	61
V0652	21.4	No	Yes	Normal	32
V0653	21.8	No	Yes	High	82
V0654	19.6	No	No	Normal	99
V0655	27.2	No	No	Normal	42
V0656	30.3	No	No	Normal	79
V0657	19.6	No	Yes	High	37
V0658	25	No	Yes	Normal	89
V0659	22.3	No	No	High	71
V0660	24.6	Yes	No	High	60
V0661	31.1	Yes	No	Normal	33
V0662	20.7	Yes	Yes	Normal	62
V0663	23	No	Yes	High	74
V0664	33.2	No	No	Normal	91
V0665	26.5	No	Yes	Normal	69
V0666	23.9	Yes	Yes	Normal	65
V0667	22.6	No	Yes	Normal	66
V0668	30	No	No	Normal	43
V0669	27.4	No	No	Normal	67
V0670	31.6	Yes	No	Normal	35
V0671	25.4	No	Yes	Normal	60
V0672	21.8	No	No	Normal	32
V0673	30.1	No	No	Normal	49
V0674	20.6	Yes	No	High	92
V0675	25.1	No	No	High	79
V0676	28.1	No	No	Normal	52
V0677	20.4	Yes	No	Normal	78
V0678	20.5	No	No	Normal	90
V0679	31.8	No	No	Normal	51
V0680	29.9	No	No	Normal	96
V0681	32.5	No	No	Normal	92
V0682	29.8	No	No	Normal	42
V0683	18.8	Yes	Yes	High	44
V0684	30	No	No	Normal	84
V0685	33.5	No	Yes	Normal	30
V0686	27.1	No	No	Normal	92
V0687	24.2	No	No	Normal	68
V0688	25	No	No	Normal	77
V0689	21.6	No	Yes	Normal	67
V0690	25.4	No	No	Normal	33
V0691	27.2	No	Yes	Normal	96
V0692	19.4	Yes	No	Normal	42
V0693	31	No	No	Normal	36
V0694	21.5	No	Yes	High	60
V0695	31.8	Yes	No	Normal	78
V0696	32.8	Yes	No	Normal	83
V0697	23.8	No	No	Normal	75
V0698	22.5	No	No	Normal	73
V0699	25.3	No	No	High	54
V0700	20.5	Yes	No	Normal	78
V0701	29.6	No	No	Normal	66
V0702	31.8	No	No	Normal	60
V0703	20.1	No	Yes	Normal	62
V0704	26.3	No	No	Normal	85
V0705	26.8	No	Yes	Normal	81
V0706	23.2	Yes	No	Normal	83
V0707	26.4	No	No	High	51
V0708	20.8	Yes	No	Normal	44
V0709	32.4	Yes	No	Normal	67
V0710	30.4	Yes	No	Normal	99
V0711	20.1	No	No	Normal	51
V0712	31.9	No	Yes	Normal	69
V0713	34	Yes	No	High	66
V0714	22.1	No	No	High	43
V0715	34.3	No	No	Normal	62
V0716	21.4	No	No	High	72
V0717	27.3	No	No	Normal	97
V0718	24.8	No	Yes	Normal	84
V0719	32	No	No	Normal	82
V0720	18.7	Yes	No	Normal	44
V0721	32.7	Yes	Yes	High	32
V0722	27.2	No	No	Normal	74
V0723	28.5	No	No	Normal	39
V0724	20.9	No	Yes	Normal	70
V0725	34.9	No	Yes	High	99
V0726	21.7	No	No	Normal	46
V0727	31.3	No	Yes	Normal	49
V0728	22.2	No	Yes	Normal	70
V0729	32.5	No	Yes	Normal	61
V0730	30.1	No	No	Normal	42
V0731	31.1	Yes	No	Normal	68
V0732	21.4	No	No	High	98
V0733	31.1	No	Yes	Normal	58
V0734	23.7	Yes	Yes	Normal	39
V0735	26.8	No	No	Normal	76
V0736	33.7	Yes	No	Normal	54
V0737	22.5	No	Yes	Normal	67
V0738	33.3	No	No	High	30
V0739	18.8	No	No	Normal	59
V0740	34.7	No	Yes	Normal	99
V0741	22	No	Yes	High	88
V0742	24.9	No	No	Normal	89
V0743	26.2	No	Yes	Normal	53
V0744	27.5	No	No	High	83
V0745	23.4	No	No	Normal	64
V0746	19.8	No	No	Normal	85
V0747	19	No	No	Normal	45
V0748	32.3	No	No	High	36
V0749	27.7	No	No	High	87
V0750	32.1	No	No	Normal	42
V0751	29.7	No	No	Normal	37
V0752	26	No	Yes	Normal	77
V0753	32.6	No	Yes	High	62
V0754	34.9	No	No	High	70
V0755	19.3	No	No	Normal	33
V0756	21.1	No	No	High	84
V0757	28.8	No	No	Normal	74
V0758	33.4	No	Yes	Normal	91
V0759	34.7	No	No	Normal	75
V0760	27.1	No	No	Normal	61
V0761	26.6	No	No	Normal	70
V0762	19.9	Yes	Yes	Normal	33
V0763	24.7	No	No	High	38
V0764	19.4	No	No	Normal	79
V0765	19.9	Yes	No	Normal	74
V0766	24	No	Yes	High	38
V0767	27.8	Yes	No	Normal	78
V0768	31.8	No	No	Normal	48
V0769	20.4	No	No	Normal	36
V0770	19.1	No	No	Normal	62
V0771	30.5	No	No	Normal	54
V0772	33.9	Yes	No	Normal	47
V0773	31.2	Yes	Yes	Normal	89
V0774	20.4	No	No	Normal	45
V0775	23.7	Yes	No	High	63
V0776	19.1	Yes	No	High	59
V0777	20.8	No	No	Normal	64
V0778	27.8	No	No	Normal	69
V0779	31.2	No	Yes	High	82
V0780	19	No	No	Normal	56
V0781	34.3	No	No	High	71
V0782	30.7	Yes	Yes	Normal	79
V0783	18.9	No	No	Normal	68
V0784	18.9	No	Yes	High	80
V0785	29.6	No	No	High	85
V0786	29.2	No	No	Normal	42
V0787	30.8	No	Yes	High	38
V0788	32.3	No	No	Normal	45
V0789	26.9	No	No	Normal	99
V0790	18.9	No	No	Normal	93
V0791	26.6	No	Yes	Normal	76
V0792	21.3	No	No	Normal	41
V0793	23	No	No	High	37
V0794	21.4	No	Yes	Normal	41
V0795	33.9	Yes	No	High	73
V0796	33.4	No	Yes	Normal	87
V0797	26.3	No	Yes	Normal	87
V0798	20	No	No	Normal	94
V0799	28.2	No	No	Normal	63
V0800	19.4	No	No	Normal	91
V0801	34.8	No	Yes	High	97
V0802	24.4	No	No	Normal	85
V0803	32.1	No	No	Normal	40
V0804	31.7	No	No	Normal	90
V0805	34.8	Yes	No	Normal	38
V0806	28.4	No	Yes	High	30
V0807	25	No	No	High	90
V0808	32.5	No	No	Normal	74
V0809	30.2	No	No	Normal	49
V0810	32	No	Yes	Normal	72
V0811	28	Yes	No	Normal	86
V0812	23.5	No	Yes	High	68
V0813	31.4	No	Yes	High	34
V0814	21	No	Yes	Normal	32
V0815	27.8	No	No	Normal	62
V0816	28.3	No	Yes	High	56
V0817	21.2	Yes	No	High	97
V0818	19.8	No	No	High	38
V0819	19.2	No	Yes	Normal	37
V0820	22	No	Yes	High	30
V0821	27.8	No	No	Normal	81
V0822	31.8	No	Yes	High	71
V0823	26.7	Yes	Yes	Normal	82
V0824	28.6	No	No	Normal	30
V0825	33.3	No	No	Normal	61
V0826	18.5	No	No	Normal	32
V0827	31.7	No	No	Normal	54
V0828	29.3	Yes	No	High	61
V0829	21.7	No	No	Normal	92
V0830	19.4	No	No	Normal	60
V0831	33	No	No	Normal	30
V0832	23.5	No	No	Normal	90
V0833	22.3	No	No	Normal	79
V0834	34.3	No	No	Normal	61
V0835	26.8	No	No	High	92
V0836	25.7	No	No	High	70
V0837	29.9	No	No	Normal	32
V0838	24.6	No	No	Normal	64
V0839	32.6	No	Yes	Normal	51
V0840	20.9	No	No	Normal	84
V0841	21.2	Yes	Yes	Normal	43
V0842	20.1	No	No	Normal	62
V0843	28.4	No	No	High	48
V0844	24	No	No	Normal	88
V0845	24.6	Yes	Yes	Normal	69
V0846	27.3	No	No	Normal	95
V0847	20.4	No	No	Normal	42
V0848	30.7	Yes	No	Normal	48
V0849	25.7	No	No	Normal	90
V0850	26.6	No	No	Normal	96
V0851	23.3	No	No	Normal	81
V0852	28.2	No	No	High	97
V0853	33.5	Yes	Yes	High	66
V0854	20.4	Yes	No	Normal	68
V0855	34.4	Yes	No	Normal	84
V0856	25.8	No	Yes	Normal	97
V0857	31.5	Yes	No	Normal	83
V0858	26.2	No	No	High	67
V0859	24.3	No	No	Normal	44
V0860	29.8	No	No	High	64
V0861	25.7	No	No	Normal	72
V0862	34.8	Yes	No	Normal	81
V0863	32.9	No	No	Normal	74
V0864	25.3	No	No	Normal	38
V0865	27.9	Yes	No	Normal	86
V0866	33.9	No	No	Normal	48
V0867	28	No	Yes	Normal	44
V0868	30.5	No	Yes	Normal	67
V0869	33.6	No	Yes	Normal	59
V0870	25.7	Yes	No	Normal	92
V0871	25.5	No	No	High	90
V0872	24.1	Yes	Yes	Normal	51
V0873	30.1	No	No	Normal	61
V0874	33	No	Yes	Normal	38
V0875	33.2	No	No	High	69
V0876	19.9	No	No	Normal	40
V0877	31.6	No	Yes	Normal	59
V0878	25.2	No	Yes	Normal	37
V0879	30.3	No	No	Normal	97
V0880	30.7	No	No	Normal	82
V0881	29.3	No	No	High	35
V0882	30.5	Yes	No	High	96
V0883	33.8	No	Yes	High	84
V0884	28	No	No	High	70
V0885	22.7	No	Yes	Normal	35
V0886	25.6	No	No	Normal	62
V0887	25.6	No	No	High	68
V0888	27.1	Yes	No	Normal	93
V0889	33.1	No	No	Normal	35
V0890	21.7	No	Yes	Normal	91
V0891	26	No	No	High	47
V0892	22.3	No	Yes	High	93
V0893	27.9	Yes	No	High	67
V0894	32	No	No	High	54
V0895	29.5	Yes	No	High	91
V0896	31.6	No	No	Normal	48
V0897	33	No	No	High	34
V0898	33.3	No	No	Normal	39
V0899	24.5	No	No	Normal	50
V0900	18.8	No	Yes	Normal	56
V0901	21.5	Yes	No	Normal	35
V0902	19.4	No	Yes	Normal	33
V0903	20.6	No	No	Normal	40
V0904	32.2	No	No	Normal	42
V0905	19.2	Yes	No	Normal	33
V0906	21.1	Yes	No	High	55
V0907	22	Yes	Yes	Normal	30
V0908	22.4	Yes	No	Normal	45
V0909	24.8	No	No	Normal	54
V0910	32.7	No	No	Normal	97
V0911	25.1	Yes	Yes	Normal	45
V0912	21.6	Yes	Yes	High	83
V0913	29.6	No	No	Normal	58
V0914	27.6	No	No	Normal	98
V0915	30.8	Yes	No	Normal	86
V0916	33.4	No	Yes	High	65
V0917	25.7	No	No	Normal	78
V0918	18.9	No	Yes	Normal	72
V0919	27.7	No	No	Normal	80
V0920	24.4	No	Yes	Normal	74
V0921	18.5	Yes	Yes	High	40
V0922	31.7	No	No	Normal	37
V0923	19	Yes	No	Normal	68
V0924	26.7	Yes	No	Normal	94
V0925	27.9	No	Yes	High	71
V0926	27.9	Yes	Yes	Normal	72
V0927	32.6	No	Yes	Normal	54
V0928	22.1	No	No	Normal	82
V0929	28.1	No	Yes	Normal	80
V0930	33.9	Yes	No	Normal	54
V0931	31.7	No	No	Normal	70
V0932	21.8	No	No	High	30
V0933	29.4	No	No	Normal	67
V0934	29.7	Yes	Yes	Normal	54
V0935	22.1	No	No	Normal	88
V0936	30.7	No	No	Normal	79
V0937	31.9	Yes	Yes	Normal	99
V0938	19.5	No	Yes	High	46
V0939	31.6	No	No	Normal	44
V0940	26.3	No	No	Normal	89
V0941	24.1	Yes	No	Normal	50
V0942	24.6	No	Yes	High	79
V0943	31.7	No	No	High	53
V0944	24.9	No	No	Normal	93
V0945	34.1	No	No	Normal	91
V0946	18.7	No	No	Normal	73
V0947	34.4	No	No	High	59
V0948	23.8	No	No	Normal	70
V0949	34.1	No	No	Normal	77
V0950	32.9	No	Yes	Normal	99
V0951	30.7	No	No	Normal	30
V0952	31	No	No	High	69
V0953	30	No	No	Normal	86
V0954	21.8	No	No	High	36
V0955	24.8	Yes	No	Normal	87
V0956	28	Yes	Yes	Normal	70
V0957	24.4	No	No	High	50
V0958	29.3	No	No	Normal	53
V0959	21	No	No	High	65
V0960	34.6	No	Yes	Normal	47
V0961	34.8	No	No	Normal	48
V0962	25.8	No	No	Normal	32
V0963	27.3	Yes	No	Normal	42
V0964	20.7	No	No	Normal	37
V0965	19.9	No	No	High	48
V0966	23.6	No	No	High	55
V0967	34.9	No	No	High	49
V0968	25	No	No	Normal	78
V0969	33.2	No	No	Normal	66
V0970	26.9	Yes	No	High	84
V0971	25.9	Yes	No	Normal	57
V0972	25.8	No	No	Normal	96
V0973	32.4	No	No	Normal	33
V0974	24.4	No	Yes	Normal	85
V0975	33.7	No	No	Normal	78
V0976	19.6	No	Yes	Normal	96
V0977	33.9	No	No	Normal	44
V0978	27.7	No	No	Normal	31
V0979	21	No	No	Normal	44
V0980	25.8	No	Yes	High	65
V0981	31.5	No	No	Normal	39
V0982	26.5	No	No	Normal	96
V0983	31.6	No	Yes	Normal	95
V0984	30.5	No	No	Normal	81
V0985	26.4	No	No	Normal	58
V0986	30.9	No	No	Normal	76
V0987	23.1	No	No	Normal	73
V0988	28.5	No	Yes	High	73
V0989	25.5	No	Yes	Normal	75
V0990	29.7	No	No	Normal	37
V0991	19.6	No	Yes	High	61
V0992	19.5	No	No	Normal	45
V0993	34.5	No	Yes	Normal	32
V0994	30.3	No	Yes	Normal	79
V0995	28.4	No	No	Normal	48
V0996	30	No	Yes	Normal	49
V0997	28.4	Yes	No	Normal	69
V0998	31.7	Yes	No	Normal	96
V0999	24.4	Yes	No	Normal	35
V1000	21.7	No	No	High	70
\.


--
-- TOC entry 3699 (class 0 OID 16476)
-- Dependencies: 218
-- Data for Name: physician; Type: TABLE DATA; Schema: public; Owner: dadb
--

COPY public.physician (physician_id, physician_name, password) FROM stdin;
D01	Sarah Johnson	111
D02	Michael Chen	222
D03	Emily Rodriguez	333
D04	James Wilson	444
D05	Maria Garcia	555
\.


--
-- TOC entry 3700 (class 0 OID 16481)
-- Dependencies: 219
-- Data for Name: visit; Type: TABLE DATA; Schema: public; Owner: dadb
--

COPY public.visit (visit_id, patient_id, visit_date) FROM stdin;
V0001	P0001	2024-12-12
V0002	P0002	2024-06-11
V0003	P0003	2024-08-03
V0004	P0004	2024-02-13
V0005	P0005	2024-04-25
V0006	P0006	2024-09-20
V0007	P0007	2024-02-11
V0008	P0008	2024-05-11
V0009	P0009	2024-03-25
V0010	P0010	2024-06-03
V0011	P0011	2024-09-18
V0012	P0012	2024-06-10
V0013	P0013	2024-05-05
V0014	P0014	2024-05-03
V0015	P0015	2024-04-13
V0016	P0016	2024-11-12
V0017	P0017	2024-06-21
V0018	P0018	2024-03-15
V0019	P0019	2024-10-22
V0020	P0020	2024-05-04
V0021	P0021	2024-04-01
V0022	P0022	2024-10-01
V0023	P0023	2024-06-08
V0024	P0024	2024-09-08
V0025	P0025	2024-08-06
V0026	P0026	2024-11-12
V0027	P0027	2024-01-16
V0028	P0028	2024-12-16
V0029	P0029	2024-10-04
V0030	P0030	2024-09-22
V0031	P0031	2024-04-14
V0032	P0032	2024-11-27
V0033	P0033	2024-12-25
V0034	P0034	2024-04-24
V0035	P0035	2024-12-22
V0036	P0036	2024-02-20
V0037	P0037	2024-12-23
V0038	P0038	2024-12-17
V0039	P0039	2024-08-09
V0040	P0040	2024-08-31
V0041	P0041	2024-12-22
V0042	P0042	2024-05-27
V0043	P0043	2024-12-29
V0044	P0044	2024-05-04
V0045	P0045	2024-09-22
V0046	P0046	2024-09-04
V0047	P0047	2024-06-04
V0048	P0048	2024-09-27
V0049	P0049	2024-10-08
V0050	P0050	2024-07-13
V0051	P0051	2024-03-17
V0052	P0052	2024-01-28
V0053	P0053	2024-02-07
V0054	P0054	2024-02-23
V0055	P0055	2024-12-12
V0056	P0056	2024-04-25
V0057	P0057	2024-01-23
V0058	P0058	2024-08-29
V0059	P0059	2024-01-12
V0060	P0060	2024-12-16
V0061	P0061	2024-07-25
V0062	P0062	2024-08-05
V0063	P0063	2024-09-25
V0064	P0064	2024-07-18
V0065	P0065	2024-01-19
V0066	P0066	2024-03-06
V0067	P0067	2024-11-06
V0068	P0068	2024-06-25
V0069	P0069	2024-09-11
V0070	P0070	2024-11-17
V0071	P0071	2024-04-29
V0072	P0072	2024-05-14
V0073	P0073	2024-05-29
V0074	P0074	2024-03-25
V0075	P0075	2024-09-22
V0076	P0076	2024-02-12
V0077	P0077	2024-01-14
V0078	P0078	2024-08-11
V0079	P0079	2024-12-07
V0080	P0080	2024-05-10
V0081	P0081	2024-10-03
V0082	P0082	2024-11-19
V0083	P0083	2024-08-03
V0084	P0084	2024-08-21
V0085	P0085	2024-12-25
V0086	P0086	2024-12-15
V0087	P0087	2024-11-12
V0088	P0088	2024-02-05
V0089	P0089	2024-04-23
V0090	P0090	2024-08-14
V0091	P0091	2024-07-28
V0092	P0092	2024-09-17
V0093	P0093	2024-10-27
V0094	P0094	2024-09-26
V0095	P0095	2024-05-08
V0096	P0096	2024-09-24
V0097	P0097	2024-04-09
V0098	P0098	2024-01-16
V0099	P0099	2024-10-13
V0100	P0100	2024-02-03
V0101	P0101	2024-08-14
V0102	P0102	2024-01-07
V0103	P0103	2024-10-17
V0104	P0104	2024-10-24
V0105	P0105	2024-11-22
V0106	P0106	2024-03-01
V0107	P0107	2024-05-19
V0108	P0108	2024-01-25
V0109	P0109	2024-10-28
V0110	P0110	2024-04-18
V0111	P0111	2024-02-22
V0112	P0112	2024-08-18
V0113	P0113	2024-09-30
V0114	P0114	2024-05-29
V0115	P0115	2024-08-23
V0116	P0116	2024-01-28
V0117	P0117	2024-10-01
V0118	P0118	2024-10-03
V0119	P0119	2024-10-29
V0120	P0120	2024-11-27
V0121	P0121	2024-03-16
V0122	P0122	2024-06-07
V0123	P0123	2024-04-12
V0124	P0124	2024-04-23
V0125	P0125	2024-11-14
V0126	P0126	2024-01-05
V0127	P0127	2024-06-12
V0128	P0128	2024-03-26
V0129	P0129	2024-05-28
V0130	P0130	2024-03-03
V0131	P0131	2024-08-12
V0132	P0132	2024-12-06
V0133	P0133	2024-05-26
V0134	P0134	2024-01-10
V0135	P0135	2024-03-18
V0136	P0136	2024-06-23
V0137	P0137	2024-07-15
V0138	P0138	2024-01-10
V0139	P0139	2024-05-29
V0140	P0140	2024-12-03
V0141	P0141	2024-09-18
V0142	P0142	2024-10-21
V0143	P0143	2024-07-22
V0144	P0144	2024-12-25
V0145	P0145	2024-12-01
V0146	P0146	2024-07-02
V0147	P0147	2024-02-06
V0148	P0148	2024-03-14
V0149	P0149	2024-11-18
V0150	P0150	2024-04-14
V0151	P0151	2024-04-29
V0152	P0152	2024-08-11
V0153	P0153	2024-01-16
V0154	P0154	2024-02-13
V0155	P0155	2024-10-13
V0156	P0156	2024-03-21
V0157	P0157	2024-11-10
V0158	P0158	2024-09-18
V0159	P0159	2024-07-25
V0160	P0160	2024-07-09
V0161	P0161	2024-04-01
V0162	P0162	2024-12-05
V0163	P0163	2024-09-19
V0164	P0164	2024-10-08
V0165	P0165	2024-11-25
V0166	P0166	2024-08-21
V0167	P0167	2024-04-18
V0168	P0168	2024-02-04
V0169	P0169	2024-05-13
V0170	P0170	2024-11-19
V0171	P0171	2024-06-14
V0172	P0172	2024-03-24
V0173	P0173	2024-10-24
V0174	P0174	2024-02-17
V0175	P0175	2024-02-26
V0176	P0176	2024-08-18
V0177	P0177	2024-09-04
V0178	P0178	2024-06-05
V0179	P0179	2024-06-22
V0180	P0180	2024-08-05
V0181	P0181	2024-01-29
V0182	P0182	2024-04-15
V0183	P0183	2024-03-22
V0184	P0184	2024-11-23
V0185	P0185	2024-07-06
V0186	P0186	2024-07-19
V0187	P0187	2024-02-08
V0188	P0188	2024-08-25
V0189	P0189	2024-09-24
V0190	P0190	2024-05-09
V0191	P0191	2024-11-11
V0192	P0192	2024-02-01
V0193	P0193	2024-11-03
V0194	P0194	2024-11-09
V0195	P0195	2024-07-26
V0196	P0196	2024-08-13
V0197	P0197	2024-07-19
V0198	P0198	2024-01-26
V0199	P0199	2024-11-01
V0200	P0200	2024-03-06
V0201	P0201	2024-05-13
V0202	P0202	2024-12-07
V0203	P0203	2024-03-19
V0204	P0204	2024-11-02
V0205	P0205	2024-02-10
V0206	P0206	2024-03-21
V0207	P0207	2024-07-21
V0208	P0208	2024-06-19
V0209	P0209	2024-08-10
V0210	P0210	2024-02-23
V0211	P0211	2024-03-21
V0212	P0212	2024-07-05
V0213	P0213	2024-11-16
V0214	P0214	2024-01-08
V0215	P0215	2024-02-08
V0216	P0216	2024-06-30
V0217	P0217	2024-02-05
V0218	P0218	2024-02-17
V0219	P0219	2024-07-23
V0220	P0220	2024-12-16
V0221	P0221	2024-12-02
V0222	P0222	2024-07-04
V0223	P0223	2024-06-04
V0224	P0224	2024-10-30
V0225	P0225	2024-05-31
V0226	P0226	2024-12-01
V0227	P0227	2024-05-26
V0228	P0228	2024-11-15
V0229	P0229	2024-08-30
V0230	P0230	2024-03-07
V0231	P0231	2024-01-09
V0232	P0232	2024-03-09
V0233	P0233	2024-11-13
V0234	P0234	2024-10-30
V0235	P0235	2024-10-21
V0236	P0236	2024-08-18
V0237	P0237	2024-01-25
V0238	P0238	2024-07-28
V0239	P0239	2024-09-06
V0240	P0240	2024-08-27
V0241	P0241	2024-09-14
V0242	P0242	2024-10-11
V0243	P0243	2024-08-13
V0244	P0244	2024-01-29
V0245	P0245	2024-11-28
V0246	P0246	2024-05-15
V0247	P0247	2024-09-11
V0248	P0248	2024-11-20
V0249	P0249	2024-10-20
V0250	P0250	2024-01-30
V0251	P0251	2024-04-15
V0252	P0252	2024-04-02
V0253	P0253	2024-05-07
V0254	P0254	2024-06-16
V0255	P0255	2024-07-23
V0256	P0256	2024-11-03
V0257	P0257	2024-08-10
V0258	P0258	2024-09-07
V0259	P0259	2024-06-11
V0260	P0260	2024-09-15
V0261	P0261	2024-07-21
V0262	P0262	2024-11-13
V0263	P0263	2024-08-10
V0264	P0264	2024-05-21
V0265	P0265	2024-06-07
V0266	P0266	2024-03-16
V0267	P0267	2024-04-15
V0268	P0268	2024-11-08
V0269	P0269	2024-09-13
V0270	P0270	2024-02-02
V0271	P0271	2024-03-06
V0272	P0272	2024-11-17
V0273	P0273	2024-11-21
V0274	P0274	2024-06-21
V0275	P0275	2024-10-30
V0276	P0276	2024-07-01
V0277	P0277	2024-10-11
V0278	P0278	2024-03-02
V0279	P0279	2024-11-07
V0280	P0280	2024-01-13
V0281	P0281	2024-07-07
V0282	P0282	2024-11-25
V0283	P0283	2024-03-05
V0284	P0284	2024-10-15
V0285	P0285	2024-01-02
V0286	P0286	2024-07-17
V0287	P0287	2024-01-24
V0288	P0288	2024-10-27
V0289	P0289	2024-11-19
V0290	P0290	2024-10-12
V0291	P0291	2024-12-10
V0292	P0292	2024-10-11
V0293	P0293	2024-07-23
V0294	P0294	2024-09-25
V0295	P0295	2024-10-15
V0296	P0296	2024-02-16
V0297	P0297	2024-08-31
V0298	P0298	2024-08-01
V0299	P0299	2024-11-29
V0300	P0300	2024-10-16
V0301	P0301	2024-07-27
V0302	P0302	2024-01-25
V0303	P0303	2024-07-09
V0304	P0304	2024-08-22
V0305	P0305	2024-07-06
V0306	P0306	2024-11-30
V0307	P0307	2024-03-01
V0308	P0308	2024-06-30
V0309	P0309	2024-08-16
V0310	P0310	2024-12-18
V0311	P0311	2024-06-08
V0312	P0312	2024-06-25
V0313	P0313	2024-04-27
V0314	P0314	2024-05-24
V0315	P0315	2024-03-02
V0316	P0316	2024-03-30
V0317	P0317	2024-05-12
V0318	P0318	2024-09-05
V0319	P0319	2024-09-01
V0320	P0320	2024-01-02
V0321	P0321	2024-05-03
V0322	P0322	2024-08-12
V0323	P0323	2024-10-17
V0324	P0324	2024-11-10
V0325	P0325	2024-12-19
V0326	P0326	2024-05-07
V0327	P0327	2024-04-27
V0328	P0328	2024-09-04
V0329	P0329	2024-08-02
V0330	P0330	2024-04-07
V0331	P0331	2024-04-07
V0332	P0332	2024-04-08
V0333	P0333	2024-07-21
V0334	P0334	2024-06-19
V0335	P0335	2024-03-09
V0336	P0336	2024-02-06
V0337	P0337	2024-10-28
V0338	P0338	2024-08-02
V0339	P0339	2024-04-03
V0340	P0340	2024-06-05
V0341	P0341	2024-06-20
V0342	P0342	2024-03-30
V0343	P0343	2024-08-21
V0344	P0344	2024-10-29
V0345	P0345	2024-12-14
V0346	P0346	2024-11-04
V0347	P0347	2024-11-01
V0348	P0348	2024-04-20
V0349	P0349	2024-04-07
V0350	P0350	2024-02-01
V0351	P0351	2024-05-10
V0352	P0352	2024-03-23
V0353	P0353	2024-03-09
V0354	P0354	2024-05-16
V0355	P0355	2024-01-23
V0356	P0356	2024-07-17
V0357	P0357	2024-04-02
V0358	P0358	2024-05-14
V0359	P0359	2024-09-13
V0360	P0360	2024-12-27
V0361	P0361	2024-05-26
V0362	P0362	2024-12-21
V0363	P0363	2024-06-15
V0364	P0364	2024-07-21
V0365	P0365	2024-09-26
V0366	P0366	2024-06-12
V0367	P0367	2024-05-04
V0368	P0368	2024-02-22
V0369	P0369	2024-12-10
V0370	P0370	2024-03-21
V0371	P0371	2024-11-09
V0372	P0372	2024-09-12
V0373	P0373	2024-06-15
V0374	P0374	2024-09-05
V0375	P0375	2024-10-11
V0376	P0376	2024-09-06
V0377	P0377	2024-12-18
V0378	P0378	2024-09-25
V0379	P0379	2024-01-24
V0380	P0380	2024-09-09
V0381	P0381	2024-12-19
V0382	P0382	2024-12-31
V0383	P0383	2024-03-25
V0384	P0384	2024-11-03
V0385	P0385	2024-05-23
V0386	P0386	2024-02-05
V0387	P0387	2024-06-05
V0388	P0388	2024-01-16
V0389	P0389	2024-06-15
V0390	P0390	2024-02-02
V0391	P0391	2024-06-30
V0392	P0392	2024-02-02
V0393	P0393	2024-06-20
V0394	P0394	2024-04-30
V0395	P0395	2024-03-14
V0396	P0396	2024-11-27
V0397	P0397	2024-04-20
V0398	P0398	2024-04-02
V0399	P0399	2024-08-09
V0400	P0400	2024-05-07
V0401	P0401	2024-11-17
V0402	P0402	2024-10-07
V0403	P0403	2024-04-25
V0404	P0404	2024-09-05
V0405	P0405	2024-02-28
V0406	P0406	2024-01-18
V0407	P0407	2024-01-19
V0408	P0408	2024-06-16
V0409	P0409	2024-12-21
V0410	P0410	2024-11-10
V0411	P0411	2024-04-28
V0412	P0412	2024-01-09
V0413	P0413	2024-02-27
V0414	P0414	2024-05-14
V0415	P0415	2024-04-10
V0416	P0416	2024-11-08
V0417	P0417	2024-05-08
V0418	P0418	2024-10-07
V0419	P0419	2024-07-27
V0420	P0420	2024-05-29
V0421	P0421	2024-12-23
V0422	P0422	2024-08-24
V0423	P0423	2024-01-01
V0424	P0424	2024-09-22
V0425	P0425	2024-05-31
V0426	P0426	2024-09-17
V0427	P0427	2024-09-27
V0428	P0428	2024-10-15
V0429	P0429	2024-07-12
V0430	P0430	2024-01-21
V0431	P0431	2024-01-09
V0432	P0432	2024-10-29
V0433	P0433	2024-05-12
V0434	P0434	2024-05-28
V0435	P0435	2024-03-04
V0436	P0436	2024-01-12
V0437	P0437	2024-01-09
V0438	P0438	2024-10-02
V0439	P0439	2024-02-17
V0440	P0440	2024-08-22
V0441	P0441	2024-11-09
V0442	P0442	2024-05-19
V0443	P0443	2024-03-24
V0444	P0444	2024-07-26
V0445	P0445	2024-06-26
V0446	P0446	2024-04-25
V0447	P0447	2024-08-12
V0448	P0448	2024-03-30
V0449	P0449	2024-09-21
V0450	P0450	2024-06-02
V0451	P0451	2024-11-04
V0452	P0452	2024-05-15
V0453	P0453	2024-02-12
V0454	P0454	2024-03-03
V0455	P0455	2024-02-24
V0456	P0456	2024-12-19
V0457	P0457	2024-11-28
V0458	P0458	2024-11-29
V0459	P0459	2024-12-18
V0460	P0460	2024-05-18
V0461	P0461	2024-04-20
V0462	P0462	2024-08-16
V0463	P0463	2024-02-23
V0464	P0464	2024-01-02
V0465	P0465	2024-08-25
V0466	P0466	2024-12-14
V0467	P0467	2024-07-15
V0468	P0468	2024-07-17
V0469	P0469	2024-04-19
V0470	P0470	2024-06-24
V0471	P0471	2024-01-24
V0472	P0472	2024-05-27
V0473	P0473	2024-12-10
V0474	P0474	2024-12-08
V0475	P0475	2024-10-12
V0476	P0476	2024-12-24
V0477	P0477	2024-06-13
V0478	P0478	2024-04-26
V0479	P0479	2024-10-05
V0480	P0480	2024-03-19
V0481	P0481	2024-09-21
V0482	P0482	2024-11-14
V0483	P0483	2024-05-12
V0484	P0484	2024-02-09
V0485	P0485	2024-11-23
V0486	P0486	2024-05-22
V0487	P0487	2024-10-10
V0488	P0488	2024-01-22
V0489	P0489	2024-07-01
V0490	P0490	2024-05-30
V0491	P0491	2024-06-26
V0492	P0492	2024-05-21
V0493	P0493	2024-05-27
V0494	P0494	2024-09-17
V0495	P0495	2024-05-21
V0496	P0496	2024-05-05
V0497	P0497	2024-11-24
V0498	P0498	2024-04-23
V0499	P0499	2024-09-15
V0500	P0500	2024-04-13
V0501	P0501	2024-01-12
V0502	P0502	2024-06-01
V0503	P0503	2024-11-21
V0504	P0504	2024-11-08
V0505	P0505	2024-02-07
V0506	P0506	2024-03-26
V0507	P0507	2024-06-21
V0508	P0508	2024-03-25
V0509	P0509	2024-03-08
V0510	P0510	2024-06-06
V0511	P0511	2024-02-09
V0512	P0512	2024-01-16
V0513	P0513	2024-05-16
V0514	P0514	2024-11-11
V0515	P0515	2024-08-17
V0516	P0516	2024-07-07
V0517	P0517	2024-03-14
V0518	P0518	2024-05-26
V0519	P0519	2024-12-01
V0520	P0520	2024-07-07
V0521	P0521	2024-04-26
V0522	P0522	2024-07-10
V0523	P0523	2024-01-08
V0524	P0524	2024-01-05
V0525	P0525	2024-10-06
V0526	P0526	2024-03-01
V0527	P0527	2024-01-29
V0528	P0528	2024-07-12
V0529	P0529	2024-09-07
V0530	P0530	2024-08-22
V0531	P0531	2024-03-25
V0532	P0532	2024-03-05
V0533	P0533	2024-05-26
V0534	P0534	2024-06-29
V0535	P0535	2024-10-19
V0536	P0536	2024-09-10
V0537	P0537	2024-05-05
V0538	P0538	2024-10-28
V0539	P0539	2024-05-13
V0540	P0540	2024-02-09
V0541	P0541	2024-10-06
V0542	P0542	2024-06-26
V0543	P0543	2024-06-14
V0544	P0544	2024-07-15
V0545	P0545	2024-01-24
V0546	P0546	2024-05-30
V0547	P0547	2024-10-01
V0548	P0548	2024-03-23
V0549	P0549	2024-02-12
V0550	P0550	2024-12-22
V0551	P0551	2024-10-25
V0552	P0552	2024-09-29
V0553	P0553	2024-12-29
V0554	P0554	2024-10-31
V0555	P0555	2024-08-08
V0556	P0556	2024-06-14
V0557	P0557	2024-05-05
V0558	P0558	2024-11-27
V0559	P0559	2024-04-28
V0560	P0560	2024-10-19
V0561	P0561	2024-08-31
V0562	P0562	2024-02-01
V0563	P0563	2024-01-24
V0564	P0564	2024-01-04
V0565	P0565	2024-12-25
V0566	P0566	2024-01-07
V0567	P0567	2024-09-24
V0568	P0568	2024-04-10
V0569	P0569	2024-10-19
V0570	P0570	2024-09-15
V0571	P0571	2024-05-22
V0572	P0572	2024-11-12
V0573	P0573	2024-06-23
V0574	P0574	2024-04-24
V0575	P0575	2024-02-21
V0576	P0576	2024-09-13
V0577	P0577	2024-12-28
V0578	P0578	2024-04-18
V0579	P0579	2024-06-22
V0580	P0580	2024-02-02
V0581	P0581	2024-11-28
V0582	P0582	2024-06-26
V0583	P0583	2024-08-07
V0584	P0584	2024-09-05
V0585	P0585	2024-02-28
V0586	P0586	2024-05-07
V0587	P0587	2024-08-06
V0588	P0588	2024-03-03
V0589	P0589	2024-09-19
V0590	P0590	2024-08-12
V0591	P0591	2024-08-03
V0592	P0592	2024-08-17
V0593	P0593	2024-02-06
V0594	P0594	2024-05-29
V0595	P0595	2024-01-08
V0596	P0596	2024-10-07
V0597	P0597	2024-11-21
V0598	P0598	2024-12-25
V0599	P0599	2024-02-07
V0600	P0600	2024-11-03
V0601	P0601	2024-01-06
V0602	P0602	2024-07-04
V0603	P0603	2024-06-21
V0604	P0604	2024-05-20
V0605	P0605	2024-01-02
V0606	P0606	2024-05-07
V0607	P0607	2024-08-15
V0608	P0608	2024-04-08
V0609	P0609	2024-04-25
V0610	P0610	2024-06-30
V0611	P0611	2024-11-05
V0612	P0612	2024-06-28
V0613	P0613	2024-10-23
V0614	P0614	2024-07-05
V0615	P0615	2024-02-10
V0616	P0616	2024-08-27
V0617	P0617	2024-09-29
V0618	P0618	2024-11-25
V0619	P0619	2024-06-06
V0620	P0620	2024-05-26
V0621	P0621	2024-02-28
V0622	P0622	2024-11-12
V0623	P0623	2024-04-27
V0624	P0624	2024-04-07
V0625	P0625	2024-11-25
V0626	P0626	2024-03-30
V0627	P0627	2024-02-29
V0628	P0628	2024-01-04
V0629	P0629	2024-05-31
V0630	P0630	2024-12-26
V0631	P0631	2024-10-17
V0632	P0632	2024-10-24
V0633	P0633	2024-10-17
V0634	P0634	2024-03-26
V0635	P0635	2024-08-09
V0636	P0636	2024-05-17
V0637	P0637	2024-01-11
V0638	P0638	2024-11-22
V0639	P0639	2024-03-08
V0640	P0640	2024-09-02
V0641	P0641	2024-08-18
V0642	P0642	2024-05-08
V0643	P0643	2024-06-26
V0644	P0644	2024-10-17
V0645	P0645	2024-12-18
V0646	P0646	2024-02-03
V0647	P0647	2024-04-15
V0648	P0648	2024-12-29
V0649	P0649	2024-12-27
V0650	P0650	2024-06-07
V0651	P0651	2024-09-03
V0652	P0652	2024-07-27
V0653	P0653	2024-06-03
V0654	P0654	2024-09-22
V0655	P0655	2024-02-11
V0656	P0656	2024-01-10
V0657	P0657	2024-08-31
V0658	P0658	2024-01-06
V0659	P0659	2024-04-02
V0660	P0660	2024-08-20
V0661	P0661	2024-11-28
V0662	P0662	2024-06-12
V0663	P0663	2024-11-15
V0664	P0664	2024-11-05
V0665	P0665	2024-03-27
V0666	P0666	2024-10-19
V0667	P0667	2024-09-17
V0668	P0668	2024-06-05
V0669	P0669	2024-07-09
V0670	P0670	2024-10-22
V0671	P0671	2024-05-03
V0672	P0672	2024-02-13
V0673	P0673	2024-04-15
V0674	P0674	2024-03-25
V0675	P0675	2024-10-28
V0676	P0676	2024-11-25
V0677	P0677	2024-01-20
V0678	P0678	2024-12-09
V0679	P0679	2024-09-13
V0680	P0680	2024-08-01
V0681	P0681	2024-12-28
V0682	P0682	2024-06-26
V0683	P0683	2024-09-20
V0684	P0684	2024-08-01
V0685	P0685	2024-05-22
V0686	P0686	2024-05-09
V0687	P0687	2024-07-21
V0688	P0688	2024-11-20
V0689	P0689	2024-04-20
V0690	P0690	2024-02-01
V0691	P0691	2024-03-19
V0692	P0692	2024-04-23
V0693	P0693	2024-06-10
V0694	P0694	2024-06-10
V0695	P0695	2024-10-14
V0696	P0696	2024-12-04
V0697	P0697	2024-06-18
V0698	P0698	2024-01-01
V0699	P0699	2024-06-26
V0700	P0700	2024-12-02
V0701	P0701	2024-05-01
V0702	P0702	2024-09-25
V0703	P0703	2024-12-03
V0704	P0704	2024-11-18
V0705	P0705	2024-08-04
V0706	P0706	2024-06-18
V0707	P0707	2024-04-02
V0708	P0708	2024-01-16
V0709	P0709	2024-07-22
V0710	P0710	2024-11-16
V0711	P0711	2024-02-27
V0712	P0712	2024-07-16
V0713	P0713	2024-09-22
V0714	P0714	2024-07-17
V0715	P0715	2024-08-11
V0716	P0716	2024-06-23
V0717	P0717	2024-07-18
V0718	P0718	2024-11-18
V0719	P0719	2024-11-07
V0720	P0720	2024-03-30
V0721	P0721	2024-10-16
V0722	P0722	2024-05-09
V0723	P0723	2024-08-14
V0724	P0724	2024-04-24
V0725	P0725	2024-02-26
V0726	P0726	2024-11-08
V0727	P0727	2024-11-14
V0728	P0728	2024-11-13
V0729	P0729	2024-02-17
V0730	P0730	2024-12-02
V0731	P0731	2024-04-07
V0732	P0732	2024-04-02
V0733	P0733	2024-02-16
V0734	P0734	2024-11-01
V0735	P0735	2024-03-05
V0736	P0736	2024-07-27
V0737	P0737	2024-09-29
V0738	P0738	2024-03-13
V0739	P0739	2024-11-06
V0740	P0740	2024-05-03
V0741	P0741	2024-10-11
V0742	P0742	2024-07-11
V0743	P0743	2024-08-08
V0744	P0744	2024-03-23
V0745	P0745	2024-09-09
V0746	P0746	2024-05-15
V0747	P0747	2024-10-09
V0748	P0748	2024-09-09
V0749	P0749	2024-02-29
V0750	P0750	2024-11-03
V0751	P0751	2024-02-16
V0752	P0752	2024-03-20
V0753	P0753	2024-05-05
V0754	P0754	2024-10-22
V0755	P0755	2024-05-14
V0756	P0756	2024-08-21
V0757	P0757	2024-12-09
V0758	P0758	2024-06-07
V0759	P0759	2024-04-04
V0760	P0760	2024-06-26
V0761	P0761	2024-02-12
V0762	P0762	2024-02-20
V0763	P0763	2024-11-04
V0764	P0764	2024-06-17
V0765	P0765	2024-02-11
V0766	P0766	2024-06-05
V0767	P0767	2024-10-22
V0768	P0768	2024-05-23
V0769	P0769	2024-04-23
V0770	P0770	2024-10-13
V0771	P0771	2024-08-25
V0772	P0772	2024-06-09
V0773	P0773	2024-09-23
V0774	P0774	2024-05-31
V0775	P0775	2024-05-26
V0776	P0776	2024-03-26
V0777	P0777	2024-01-11
V0778	P0778	2024-10-23
V0779	P0779	2024-02-09
V0780	P0780	2024-09-05
V0781	P0781	2024-06-10
V0782	P0782	2024-01-19
V0783	P0783	2024-04-14
V0784	P0784	2024-01-24
V0785	P0785	2024-11-07
V0786	P0786	2024-09-02
V0787	P0787	2024-08-04
V0788	P0788	2024-05-31
V0789	P0789	2024-06-03
V0790	P0790	2024-02-17
V0791	P0791	2024-01-15
V0792	P0792	2024-06-21
V0793	P0793	2024-01-30
V0794	P0794	2024-01-05
V0795	P0795	2024-09-04
V0796	P0796	2024-10-26
V0797	P0797	2024-05-29
V0798	P0798	2024-04-26
V0799	P0799	2024-09-18
V0800	P0800	2024-06-28
V0801	P0801	2024-01-08
V0802	P0802	2024-03-26
V0803	P0803	2024-04-14
V0804	P0804	2024-02-28
V0805	P0805	2024-05-08
V0806	P0806	2024-07-06
V0807	P0807	2024-05-06
V0808	P0808	2024-11-01
V0809	P0809	2024-04-27
V0810	P0810	2024-12-01
V0811	P0811	2024-05-17
V0812	P0812	2024-02-27
V0813	P0813	2024-09-05
V0814	P0814	2024-01-10
V0815	P0815	2024-05-25
V0816	P0816	2024-06-19
V0817	P0817	2024-04-08
V0818	P0818	2024-04-05
V0819	P0819	2024-08-18
V0820	P0820	2024-11-28
V0821	P0821	2024-10-26
V0822	P0822	2024-01-10
V0823	P0823	2024-11-12
V0824	P0824	2024-06-03
V0825	P0825	2024-06-12
V0826	P0826	2024-05-25
V0827	P0827	2024-08-04
V0828	P0828	2024-11-19
V0829	P0829	2024-03-04
V0830	P0830	2024-04-22
V0831	P0831	2024-12-07
V0832	P0832	2024-09-13
V0833	P0833	2024-01-09
V0834	P0834	2024-05-03
V0835	P0835	2024-11-04
V0836	P0836	2024-12-31
V0837	P0837	2024-09-15
V0838	P0838	2024-08-10
V0839	P0839	2024-02-12
V0840	P0840	2024-02-18
V0841	P0841	2024-08-23
V0842	P0842	2024-02-27
V0843	P0843	2024-12-01
V0844	P0844	2024-02-04
V0845	P0845	2024-07-12
V0846	P0846	2024-07-27
V0847	P0847	2024-01-11
V0848	P0848	2024-07-07
V0849	P0849	2024-04-05
V0850	P0850	2024-01-05
V0851	P0851	2024-11-09
V0852	P0852	2024-03-17
V0853	P0853	2024-08-08
V0854	P0854	2024-05-31
V0855	P0855	2024-12-29
V0856	P0856	2024-10-03
V0857	P0857	2024-09-29
V0858	P0858	2024-01-18
V0859	P0859	2024-05-01
V0860	P0860	2024-04-20
V0861	P0861	2024-08-02
V0862	P0862	2024-05-27
V0863	P0863	2024-12-06
V0864	P0864	2024-10-16
V0865	P0865	2024-04-10
V0866	P0866	2024-09-17
V0867	P0867	2024-05-18
V0868	P0868	2024-09-10
V0869	P0869	2024-08-08
V0870	P0870	2024-07-19
V0871	P0871	2024-03-28
V0872	P0872	2024-01-29
V0873	P0873	2024-03-25
V0874	P0874	2024-04-09
V0875	P0875	2024-03-20
V0876	P0876	2024-03-29
V0877	P0877	2024-08-06
V0878	P0878	2024-01-22
V0879	P0879	2024-04-27
V0880	P0880	2024-08-05
V0881	P0881	2024-05-23
V0882	P0882	2024-11-07
V0883	P0883	2024-04-10
V0884	P0884	2024-08-04
V0885	P0885	2024-11-08
V0886	P0886	2024-03-24
V0887	P0887	2024-11-16
V0888	P0888	2024-01-15
V0889	P0889	2024-07-22
V0890	P0890	2024-06-06
V0891	P0891	2024-06-05
V0892	P0892	2024-08-31
V0893	P0893	2024-09-29
V0894	P0894	2024-04-14
V0895	P0895	2024-02-20
V0896	P0896	2024-11-20
V0897	P0897	2024-04-14
V0898	P0898	2024-02-02
V0899	P0899	2024-11-22
V0900	P0900	2024-03-04
V0901	P0901	2024-06-17
V0902	P0902	2024-10-14
V0903	P0903	2024-07-11
V0904	P0904	2024-07-18
V0905	P0905	2024-01-13
V0906	P0906	2024-09-04
V0907	P0907	2024-06-21
V0908	P0908	2024-12-17
V0909	P0909	2024-03-13
V0910	P0910	2024-04-06
V0911	P0911	2024-04-07
V0912	P0912	2024-09-22
V0913	P0913	2024-04-30
V0914	P0914	2024-10-05
V0915	P0915	2024-03-23
V0916	P0916	2024-05-29
V0917	P0917	2024-08-11
V0918	P0918	2024-06-15
V0919	P0919	2024-01-12
V0920	P0920	2024-12-11
V0921	P0921	2024-04-13
V0922	P0922	2024-08-05
V0923	P0923	2024-08-23
V0924	P0924	2024-12-15
V0925	P0925	2024-07-17
V0926	P0926	2024-07-15
V0927	P0927	2024-12-03
V0928	P0928	2024-04-23
V0929	P0929	2024-05-02
V0930	P0930	2024-02-11
V0931	P0931	2024-04-17
V0932	P0932	2024-03-14
V0933	P0933	2024-02-13
V0934	P0934	2024-04-04
V0935	P0935	2024-07-20
V0936	P0936	2024-04-14
V0937	P0937	2024-06-04
V0938	P0938	2024-10-20
V0939	P0939	2024-11-14
V0940	P0940	2024-05-14
V0941	P0941	2024-04-12
V0942	P0942	2024-03-13
V0943	P0943	2024-09-19
V0944	P0944	2024-08-30
V0945	P0945	2024-06-04
V0946	P0946	2024-07-28
V0947	P0947	2024-06-20
V0948	P0948	2024-04-16
V0949	P0949	2024-06-09
V0950	P0950	2024-04-29
V0951	P0951	2024-01-26
V0952	P0952	2024-12-23
V0953	P0953	2024-01-04
V0954	P0954	2024-06-14
V0955	P0955	2024-11-04
V0956	P0956	2024-05-29
V0957	P0957	2024-01-30
V0958	P0958	2024-12-19
V0959	P0959	2024-04-10
V0960	P0960	2024-01-17
V0961	P0961	2024-08-12
V0962	P0962	2024-11-21
V0963	P0963	2024-02-08
V0964	P0964	2024-08-20
V0965	P0965	2024-12-10
V0966	P0966	2024-07-12
V0967	P0967	2024-08-13
V0968	P0968	2024-11-12
V0969	P0969	2024-10-20
V0970	P0970	2024-08-09
V0971	P0971	2024-05-28
V0972	P0972	2024-02-12
V0973	P0973	2024-12-20
V0974	P0974	2024-03-27
V0975	P0975	2024-10-31
V0976	P0976	2024-10-26
V0977	P0977	2024-05-13
V0978	P0978	2024-01-05
V0979	P0979	2024-07-31
V0980	P0980	2024-03-24
V0981	P0981	2024-02-27
V0982	P0982	2024-08-25
V0983	P0983	2024-12-20
V0984	P0984	2024-04-19
V0985	P0985	2024-01-13
V0986	P0986	2024-12-31
V0987	P0987	2024-05-29
V0988	P0988	2024-04-24
V0989	P0989	2024-09-15
V0990	P0990	2024-06-10
V0991	P0991	2024-11-17
V0992	P0992	2024-05-03
V0993	P0993	2024-05-15
V0994	P0994	2024-07-28
V0995	P0995	2024-09-27
V0996	P0996	2024-10-06
V0997	P0997	2024-04-01
V0998	P0998	2024-04-01
V0999	P0999	2024-10-04
V1000	P1000	2024-11-24
\.


--
-- TOC entry 3548 (class 2606 OID 16515)
-- Name: diagnosis diagnosis_pkey; Type: CONSTRAINT; Schema: public; Owner: dadb
--

ALTER TABLE ONLY public.diagnosis
    ADD CONSTRAINT diagnosis_pkey PRIMARY KEY (visit_id);


--
-- TOC entry 3546 (class 2606 OID 16505)
-- Name: lifestyle lifestyle_pkey; Type: CONSTRAINT; Schema: public; Owner: dadb
--

ALTER TABLE ONLY public.lifestyle
    ADD CONSTRAINT lifestyle_pkey PRIMARY KEY (visit_id);


--
-- TOC entry 3538 (class 2606 OID 16475)
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: dadb
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 3544 (class 2606 OID 16495)
-- Name: patienttest patienttest_pkey; Type: CONSTRAINT; Schema: public; Owner: dadb
--

ALTER TABLE ONLY public.patienttest
    ADD CONSTRAINT patienttest_pkey PRIMARY KEY (visit_id);


--
-- TOC entry 3540 (class 2606 OID 16480)
-- Name: physician physician_pkey; Type: CONSTRAINT; Schema: public; Owner: dadb
--

ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_pkey PRIMARY KEY (physician_id);


--
-- TOC entry 3542 (class 2606 OID 16485)
-- Name: visit visit_pkey; Type: CONSTRAINT; Schema: public; Owner: dadb
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_pkey PRIMARY KEY (visit_id);


--
-- TOC entry 3552 (class 2606 OID 16516)
-- Name: diagnosis diagnosis_visit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dadb
--

ALTER TABLE ONLY public.diagnosis
    ADD CONSTRAINT diagnosis_visit_id_fkey FOREIGN KEY (visit_id) REFERENCES public.visit(visit_id);


--
-- TOC entry 3551 (class 2606 OID 16506)
-- Name: lifestyle lifestyle_visit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dadb
--

ALTER TABLE ONLY public.lifestyle
    ADD CONSTRAINT lifestyle_visit_id_fkey FOREIGN KEY (visit_id) REFERENCES public.visit(visit_id);


--
-- TOC entry 3550 (class 2606 OID 16496)
-- Name: patienttest patienttest_visit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dadb
--

ALTER TABLE ONLY public.patienttest
    ADD CONSTRAINT patienttest_visit_id_fkey FOREIGN KEY (visit_id) REFERENCES public.visit(visit_id);


--
-- TOC entry 3549 (class 2606 OID 16486)
-- Name: visit visit_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dadb
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);


-- Completed on 2025-04-16 11:38:06 EDT

--
-- PostgreSQL database dump complete
--

