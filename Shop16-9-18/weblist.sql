-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 06, 2019 alle 19:06
-- Versione del server: 10.1.21-MariaDB
-- Versione PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weblist`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `accessochat`
--

CREATE TABLE `accessochat` (
  `ListaSpesa_idListaSpesa` int(11) DEFAULT NULL,
  `Utente_idUtente` int(11) DEFAULT NULL,
  `ultimo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `accessochat`
--

INSERT INTO `accessochat` (`ListaSpesa_idListaSpesa`, `Utente_idUtente`, `ultimo`) VALUES
(12, 19, '2019-01-06 17:58:11'),
(13, 19, '2019-01-06 17:10:35'),
(14, 19, '2019-01-06 17:11:43'),
(15, 20, '2019-01-06 17:17:29'),
(16, 22, '2019-01-06 17:19:53'),
(17, 24, '2019-01-06 17:22:35'),
(18, 25, '2019-01-06 17:26:47'),
(19, 26, '2019-01-06 17:28:40'),
(20, 27, '2019-01-06 17:30:49'),
(21, 28, '2019-01-06 17:32:57'),
(14, 20, '2019-01-06 18:00:54'),
(14, 21, '2019-01-06 18:01:14'),
(14, 22, '2019-01-06 18:01:28'),
(14, 24, '2019-01-06 18:06:17'),
(14, 25, '2019-01-06 18:02:42'),
(14, 26, '2019-01-06 18:02:58'),
(14, 27, '2019-01-06 18:03:17'),
(14, 28, '2019-01-06 18:03:37'),
(15, 21, '2019-01-06 18:05:01');

-- --------------------------------------------------------

--
-- Struttura della tabella `categorialista`
--

CREATE TABLE `categorialista` (
  `idCategoriaLista` int(11) NOT NULL,
  `idTypes` int(11) DEFAULT NULL,
  `Descrizione` varchar(140) DEFAULT NULL,
  `Nome` varchar(140) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `categorialista`
--

INSERT INTO `categorialista` (`idCategoriaLista`, `idTypes`, `Descrizione`, `Nome`) VALUES
(3, 23, 'tutto quello che puoi comprare di commestibile', 'Supermercato/Alimentari'),
(4, 11, 'la tecnologia che cerchi', 'Negozio di elettronica'),
(5, 14, 'tutto quello che ti serve per i lavori fai da te', 'Ferramenta'),
(6, 22, 'tutto quello che serve per il tuo tempo libero', 'Negozio');

-- --------------------------------------------------------

--
-- Struttura della tabella `categoriaprodotto`
--

CREATE TABLE `categoriaprodotto` (
  `idCategoriaProdotto` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Descrizione` varchar(140) DEFAULT NULL,
  `Logo_idLogo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `categoriaprodotto`
--

INSERT INTO `categoriaprodotto` (`idCategoriaProdotto`, `Nome`, `Descrizione`, `Logo_idLogo`) VALUES
(2, 'Frutta e verdura', 'la frutta e verdura fresca', 15),
(3, 'Gastronomia', 'tutti i piatti pronti per essere mangiati', 16),
(4, 'Surgelati', 'i surgelati che ti aggradano', 17),
(5, 'Alcolici', 'la nostra selezione di bevande riservate agli adulti', 18),
(6, 'Pescheria', 'il pescato del giorno selezionato con cura', 19),
(7, 'Giardinaggio', 'i migliori prodotti per prenderti cura del tuo giardino', 20),
(8, 'Muratura', 'tutto quello che serve per sistemare la casa', 21),
(9, 'Falegnameria', 'gli oggetti  che ti aiuteranno a stupire per i tuoi lavoretti casalinghi', 22),
(10, 'Semenze', 'per prodotti a km 0', 23),
(11, 'Idraulica', 'quell che serve per sistemare qualsiasi perdita', 24),
(12, 'Televisori', 'tutte le marche di tutti i televisori sul mercato', 25),
(13, 'Smartphone', 'tutte le marche di tutti gli smartphone sul mercato', 26),
(14, 'Computer', 'tutte le marche di tutti i computer sul mercato', 27),
(15, 'Console e videogiochi', 'tutti i titoli del momento', 28),
(16, 'Cuffie e auricolari', 'tutto i modelli per ascoltare della buona musica', 29),
(17, 'Calcio e calcio a 5', 'lo sport piu praticato', 30),
(18, 'Pallavolo', 'tutto quello che serve per buttare la palla al di la della rete', 31),
(19, 'Sport acquatici', 'tutto quello che serve per divertirti in acqua', 32),
(20, 'Sport motoristici', 'tutto quello che serve per provare il brivido della velocita', 35),
(21, 'Sport estremi', 'tutto quello che serve per avere una scarica di adrenalina', 36);

-- --------------------------------------------------------

--
-- Struttura della tabella `immagine`
--

CREATE TABLE `immagine` (
  `idImmagini` int(11) NOT NULL,
  `Indirizzo` varchar(140) NOT NULL,
  `Prodotto_idProdotto` int(11) DEFAULT NULL,
  `CategoriaLista_idCategoriaLista` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `immagine`
--

INSERT INTO `immagine` (`idImmagini`, `Indirizzo`, `Prodotto_idProdotto`, `CategoriaLista_idCategoriaLista`) VALUES
(1, 'avatarBase.jpg', NULL, NULL),
(35, 'ZlivdlCiTzKRkaATerfHyb8gA.jpg', NULL, 3),
(36, '0TcELeWc7u4TwUgaFSUrJVYxJ.jpg', NULL, 4),
(37, 'HXHA8veOFGtqEToMGIH39RZPy.jpg', NULL, 5),
(38, 'AR4O2ZAqRDBQvpQkuiLu0NTsK.jpg', NULL, 6),
(39, 'fLzLHlFX2VZbetQk3O42j3pTB.jpg', 11, NULL),
(40, 'b9dMyQhOJLgZtd2FXgsggyxRH.jpg', 12, NULL),
(41, 'm91maRWWtSyTHDfh2k4QmYxeO.jpg', 13, NULL),
(42, 'Gp1kNmlCyS0sGdXNNiYW3kpYw.jpg', 14, NULL),
(43, 'gxXWAgc6pLNhKWACCqmHDyl4c.jpg', 15, NULL),
(44, 'MlM0LRKN8ntbBFcjhZi1lCrE1.jpg', 16, NULL),
(45, 'Mm6Az3QopCWuZQrFL4hKjydlp.jpg', 17, NULL),
(46, 'JEBl9qRg0qMmlSaUxkBGjLdhW.jpg', 18, NULL),
(47, 'tQI7s0MCD5owIbNZMtrjWwNtM.jpg', 19, NULL),
(48, 'xj5KmKgOoybWFny1zomqssGNT.jpg', 20, NULL),
(49, 'DYKnSLGpUcKq8V5VAZG5FqMFe.jpg', 21, NULL),
(50, '1fYNhoH0bIv8H1F1foszkaNyC.jpg', 22, NULL),
(51, 'Ln3E9zhJcnyymSlAd1nm3C1Kn.jpg', 23, NULL),
(52, '1XcWBKclA3eQrgMGx073TQZ4x.jpg', 24, NULL),
(53, 'EBGbf8PWtREv2CxAfSwb5XJCz.jpg', 25, NULL),
(54, 'OYtFrCP5EpvSXHMvg40cdpggJ.jpg', 26, NULL),
(55, 'UnzqJg3UVBO4HwfWXzCMYS83r.jpg', 27, NULL),
(56, '7xxxDS7iEtOygG8DgIpx9pFuc.jpg', 28, NULL),
(57, '8Eyk9NactpIS1KDI5MqJFfuFD.jpg', 29, NULL),
(58, 'aVeNvtMguGH93YbgGdpTar8xY.jpg', 30, NULL),
(59, 'HaxtnRXzCasCfxrgllSGCxorX.jpg', 31, NULL),
(60, 'oLzSp2bv67f63rMjit22g45NP.jpg', 32, NULL),
(61, '4u1moRDMFRE7JQvBECeKktxae.jpg', 33, NULL),
(62, '4Hst55yXQp7MwqllbMGZkFPK5.jpg', 34, NULL),
(63, '976AuCmJPhmYQDIVVbexPlZD0.jpg', 35, NULL),
(64, 'X0IGHnGOiBFBfnphGa75vRlpr.jpg', 36, NULL),
(65, 'tQZt5sgNTxUGJ7UZHLs8hM1Qe.jpg', 37, NULL),
(66, 'hpKbbIRaP7BkIprFcgoE36fUv.jpg', 38, NULL),
(67, '3LCuozd5iZ7ICZlnI53uv6UXP.jpg', 39, NULL),
(68, 'gYuJLtg1YAzorq5I866C77yw0.jpg', 40, NULL),
(69, 'PM20k66SlhxGm3Tuj1acBLlDb.jpg', 41, NULL),
(70, 'NmOUHrgbkJHqBV8Notb52n9GC.jpg', 42, NULL),
(71, 'dVuI8waZC1f7vX1ETMI7GNrRi.jpg', 43, NULL),
(72, '0Dk6RvnLM5NsPzVBqYCSxuBSN.jpg', 44, NULL),
(73, 'QoOLGk2xek7J4jk1j9LZj6axA.jpg', 45, NULL),
(74, 'Pchnjlw1cMHkM9v9G3d1EJNkq.jpg', 46, NULL),
(75, '8fhYQ4zZqPF17QYzCnVcpJ08O.jpg', 47, NULL),
(76, 'DXWj7eJdKvln9vMe7n9scCzUj.jpg', 48, NULL),
(77, 'wPdv1m5Y4DQIron3QTN932zb4.jpg', 49, NULL),
(78, 'oxwai1lDsZAsIijjCwSDLGbWZ.jpg', 50, NULL),
(79, 'tvN966HgSOCyJyGRLFbjh18cG.jpg', 51, NULL),
(80, 'fJScMBSKPLveL1o6dgLUu8beg.jpg', 52, NULL),
(81, 'xV0XJ6TipKzcncPUuYyonsu1q.jpg', 53, NULL),
(82, 'fLWZ8YLewyYRTFZKuwWUQG2Rn.jpg', 54, NULL),
(83, 'qOLNYqGrYzTXCKPnMdQxlRRa7.jpg', 55, NULL),
(84, 'YDgr0Y0Y84UqqhuBshxf0JKB2.jpg', 56, NULL),
(85, 'DcE68M553PU8pdaW2gSx6JeR0.jpg', 57, NULL),
(86, 'DqzZW4TrUooKp2mE8mmAm6cFy.jpg', 58, NULL),
(87, 'YrCxvsGVEdTRtwWa6TGAGU6Ts.jpg', 59, NULL),
(88, 'NeDJ6IGO9kYn9csorbOhRHdot.jpg', 60, NULL),
(89, 'Pi08ze2Cyc7XCaQ9KDzGod8Nq.jpg', 61, NULL),
(90, 'KUkdifAJqRd3WzZewPSVjoLel.jpg', 62, NULL),
(91, 'UeDBc2Q79fPvh4qdOsi9vs4H2.jpg', 63, NULL),
(92, 'cIpRzlxK72gfxgk8bazqxnFOz.jpg', 64, NULL),
(93, 'IUwRxambDr1sv5FNMzDVw09I9.jpg', 65, NULL),
(94, 'pFdStuKsHkIeUVmfKYLecndKN.jpg', 66, NULL),
(95, '5MN8xEACwbzftRdTEGUYTc8SQ.jpg', 67, NULL),
(96, '0tIwT4SeFeCshyeqqoklE6kLj.jpg', 68, NULL),
(97, 'HcZJszOj1LNTBJcsZbBPgZ07Z.jpg', 69, NULL),
(98, '9TP5r0dYG9Ux6lYqcoX6u7iY5.jpg', 70, NULL),
(99, '8RW9hlhCiZiajDqsyBzzCW5Nj.jpg', 71, NULL),
(100, '08E46ZhQMJc7MemKzpYWXDaoE.jpg', 72, NULL),
(101, '1RFsflIZWUo3IrlxMo6bsdRkd.jpg', 73, NULL),
(102, 'zVrFvEefxyihLcbVBgbvfQ3Ne.jpg', 74, NULL),
(103, 'oBMhlwSHFHbEdjVmxge1NwQ73.jpg', 75, NULL),
(104, 'RdM3tX3UydZ3dMxwhF5GPDETd.jpg', 76, NULL),
(105, '6m2p3coUNr1HNjOUY39GzsxYA.jpg', 77, NULL),
(106, 'NPprAk10EMaIIlfvBCzWFLe1q.jpg', 78, NULL),
(107, 'wITBTzK9N82OKHgXXLxJcfNRW.jpg', 79, NULL),
(108, 'rJujGEPZlQfQJbWM0ShjYJDm0.jpg', 80, NULL),
(109, '6EnbfsPD1xEqxHluP94J81zY9.jpg', 81, NULL),
(110, 'WltmyjVd3JAz6eoJ9NI2GHHLG.jpg', 82, NULL),
(111, 'wZXegrjv5vLtzbHphwKolJ63S.jpg', 83, NULL),
(112, 'IQUiYMFm4QmGJ5CTmAXRUqAEY.jpg', 84, NULL),
(113, 'C9EnpNtxcQ6IQSH7v2RFlQ2Dm.jpg', 85, NULL),
(114, 'DpONMQJPrYWktKWOwVL2lQFDs.jpg', 86, NULL),
(115, 'z75oH8iFPrJAx5BQ1clGQZdZM.jpg', 87, NULL),
(116, 'yk3T92TDusrH4Ol0JOpN3f1NF.jpg', 88, NULL),
(117, 'uOQz3anctnAG7o2KSyLOHXg2p.jpg', 89, NULL),
(118, 'BGTkC6AC9KOEjYGTYPgJC8nO4.jpg', 90, NULL),
(119, 'F3rwaiIHhWriHlSj6MQaZI7uL.jpg', 91, NULL),
(120, 'mlCK0nIURt7NvWjOxJlaPBmj1.jpg', 92, NULL),
(121, '3h4GW9oNh1uh2cmfuvuIiKFJp.jpg', 93, NULL),
(122, 'as5zF3QiBrUgQlXhcFuesGCfO.jpg', 94, NULL),
(123, 'Y0A82vKerM9lcOD9P1zuoBB2U.jpg', 95, NULL),
(124, 'HVEwvnxlt2bCip3AiclVwcAAw.jpg', 96, NULL),
(125, 'yhPnjbqVY72YfZr7MJm3dcCBi.jpg', 97, NULL),
(126, 'Gya3MFndJtGeERtQjbdasx6Xh.jpg', 98, NULL),
(127, '0YAipYKw67MBFJatoVsT3hTgN.jpg', 99, NULL),
(128, '5Ay4Y7V47mOPueKOaeTkMnsk7.jpg', 100, NULL),
(129, 'HJdRaj45cnmry1RlVo9Hs85nT.jpg', 101, NULL),
(130, 'He2X2BkaejM9rtoVDVYZ2fUp8.jpg', 102, NULL),
(131, 'r5cIZcom3XFRr5BPtOgYDBX5f.jpg', 103, NULL),
(132, 'J3nEO1f9c6UXhBNBoYFlgtLce.jpg', 104, NULL),
(133, 'O80TrfMAj6a2v8bHWw57k2JQl.jpg', 105, NULL),
(134, 's12GZG0D6nfJjikmE3EUasfPs.jpg', 106, NULL),
(135, '98fcUvQmMjDGR2trTplAzvOl9.jpg', 107, NULL),
(136, 'AE7xfJ7841YWo7RKV9rwo0U7L.jpg', 108, NULL),
(137, 'X6tHFL18NcfxYZ6EBYpZmcv27.jpg', 109, NULL),
(138, 'KvjQhzJJhkKQKsCHDETcKNVrm.jpg', 110, NULL),
(139, 'g0O7SgKMl2w5PWTDlnsxdhwBA.jpg', 111, NULL),
(140, 'UFwyvNNMMrQeKz6fDkcbcN8Dv.jpg', 112, NULL),
(141, 'kOgYfOAWdExJZ71IpdSkHzIHg.jpg', 113, NULL),
(142, 'aOjn76AEEYCnhRNw5aMJ8nxVO.jpg', 114, NULL),
(143, 'GWbPZHZL4D3xJSgvG0pAXtSxT.jpg', 115, NULL),
(144, 'DllCxmq5jfoEUZnIVjE5WnSOK.jpg', 116, NULL),
(145, 'hTHhq8rnib4NbQcwkx2cbNmF0.jpg', 117, NULL),
(146, 'DuakstJ9eY2fecGBqJdkj9abT.jpg', 118, NULL),
(147, 'C1lycDIEZ79Jc7TdDUnczJfzM.jpg', 119, NULL),
(148, 'iPj2Nfn9KuNfjwcNBHxr8S6MP.jpg', 120, NULL),
(149, 'urkW45eDh2fYT2wkYTmOuC9ek.jpg', NULL, NULL),
(150, 'IO7yW2XhaHT8bfnj6tB03A5zs.jpg', 121, NULL),
(151, 'X005HOxhXHfbFrhdFOZO9WODS.jpg', 122, NULL),
(152, 'Dstx6DfGk9vCZRi5OJ5JN90Ut.jpg', 123, NULL),
(153, 'REDREOeJhlyxlvHqpeCWv5mn0.jpg', 124, NULL),
(154, 'rMBdkEVHODAjTNvyDnRUs4lFy.jpg', 125, NULL),
(155, 'acMORCDtMjgzULA96qcxx6nG5.jpg', 126, NULL),
(156, 'HIQI1lGbbP9qoqutJ0MpYkS4c.jpg', 127, NULL),
(157, 'juUN58IIpzVxD4yp3awknUbN2.jpg', 128, NULL),
(158, 'oyRMS6D1Q2LRDV5Xx1IcXSE9z.jpg', 129, NULL),
(159, 'WVn8DhemtTAoxIoZIvUQqmpB2.jpg', 130, NULL),
(160, 'Ybb7w5RpyBJTbnETnZqSjO1D7.jpg', 131, NULL),
(161, 'wEbeGyLbZYuD32MQ7X97HYL8s.jpg', 132, NULL),
(162, 'ARc5n1lWAc7Gfe4f9yMn0CyTw.jpg', 133, NULL),
(163, 'CvipskcCDhVGtBeIrcIV4Gy0w.jpg', 134, NULL),
(164, 'GIRQU8hvUyaRiOneWhkJKqzEs.jpg', 135, NULL),
(165, 'NMprAM9q74YZbODJQQQFCkARX.jpg', 136, NULL),
(166, 'GC1zIwvl8vWGceNZqGGByqb6f.jpg', 137, NULL),
(167, 'mugkbasm89FjP0F2FXlc91XS9.jpg', 138, NULL),
(168, 'kWsEqi3w3aKo3seyxdbmtJgFE.jpg', 139, NULL),
(169, 'y5kosRvju9s1CiYedVlakUzul.jpg', 140, NULL),
(170, 'Y9jYFh8rHwjAkhlOPnb93Yoi3.jpg', 141, NULL),
(171, '0jhqlkMDtdjL58rOccXDT5uX7.jpg', 142, NULL),
(172, '78ZLvDk5UB6QZd9ynnnPYwCvY.jpg', 143, NULL),
(173, '3McUoOXA0IZxsiAlSgAyzpm0M.jpg', 144, NULL),
(174, 'uz6X5nryNVyQUC8d2cm7ffHAr.jpg', 145, NULL),
(175, 'dxNNDq7gwhPEA3cOwruBXeDbw.jpg', 146, NULL),
(176, 'xAmyKDJT9YO7WXprFrKBcdUIE.jpg', 147, NULL),
(177, '1RbjVFmLLnfOojdyAAMwwFtyC.jpg', 148, NULL),
(178, 'gbFDtkDk95HHWxPwdLV7PGZ0A.jpg', 149, NULL),
(179, 'Ufl8fy9IXs8GqMaxnAXHMxoBJ.jpg', 150, NULL),
(180, 'o8obCRhBgSqNdDGbA8u3rlgPs.jpg', 151, NULL),
(181, 'AIg6rgj3NJqQmiIZ6fCr4nZML.jpg', 152, NULL),
(182, 'PksIfR9XO9a1rrtTRyd0Fohie.jpg', 153, NULL),
(183, '9nVWXyttlZdweEStxkY6jDugT.jpg', 154, NULL),
(184, 'jOo9Oq9LUjv0pCAMCkyueknY0.jpg', 155, NULL),
(185, '9V6Y13hORkvZaUGTFJQ3jXU1n.jpg', 156, NULL),
(186, 'g7j7zBzymMXFt3RCipH2uvnES.jpg', 157, NULL),
(187, 'M1MFO1BVZyvydhGdp39VrUEak.jpg', 158, NULL),
(188, 'NgA0ktBqHsTjIvsZxFECDne6Q.jpg', 159, NULL),
(189, 'aiz7VCdDzaVvAyEqjsD4jhFUO.jpg', 160, NULL),
(190, 'JXZkS7lWxtGAJjldnl55EsNuF.jpg', 161, NULL),
(191, '8kN8lm8CvTPbX2c3IyB8JXEOS.jpg', 162, NULL),
(192, 'tIFsvYhHOJmtXxcivHzWnDLGr.jpg', 163, NULL),
(193, 'BTiGRizQfiGF01qJATX17g2HD.jpg', 164, NULL),
(194, '728QMwTJzkxggQjqwmpZe6oYm.jpg', 165, NULL),
(195, 'VK4jyuxWegkfMi6elIpWbitbh.jpg', 166, NULL),
(196, 'lQtRk0Hy1wpDZajcUF4YbViv3.jpg', 167, NULL),
(197, 'OmbunJTjDDpMZaoszOIDamJyh.jpg', 168, NULL),
(198, 'U0VkrefZ4QRQkYu29Sl6aXDKc.jpg', 169, NULL),
(199, 'o51Ho4aC4kX3tdG5zzwZGeRWb.jpg', 170, NULL),
(200, 'WEEwYXRTxJLUz0BMky7cryKjJ.jpg', 171, NULL),
(201, 'TbTX1mfgum6Ks9rEJlrBAJW0F.jpg', 172, NULL),
(202, 'YvmFlY2MZUa0otvrnly9GiWpu.jpg', 173, NULL),
(203, 'mQyzogL7lmFMS8MTBF9An7n8R.jpg', 174, NULL),
(204, 'HPnYaW2eBTU2h9hasa97nbqmo.jpg', 175, NULL),
(205, '1d1URfNi7iUznGrb3854yse2D.jpg', 176, NULL),
(206, 'd8XSmqxtfyqcBgToJuNa66063.jpg', 177, NULL),
(207, 'xF3DlHSWn84sZQFDGbVj3OSNa.jpg', 178, NULL),
(208, 'TNbHhXZgflKIpogW0pEoaROyd.jpg', 179, NULL),
(209, 'DnI070jZlooBiSjKJ5QBR6MkB.jpg', 180, NULL),
(210, '0m9gy7PPy7sZJa3CzZPNOoRSJ.jpg', 181, NULL),
(211, 'QXxZo1TbwpsNxGvZ4k2O8Jb6j.jpg', 182, NULL),
(212, 'fY8ft0Hq4MW3BftpvMbkNxgiY.jpg', 183, NULL),
(213, 'OO9tHafKkKIMvQUDjCx70ZOxP.jpg', 184, NULL),
(214, 'QlsddhCkZr4hkXVWC5deFetpG.jpg', 185, NULL),
(215, 'ZXV7FUvX1eOtyELaE95nuMS20.jpg', 186, NULL),
(216, 'JQVwKlj0xTqBmmHUlemLUffvz.jpg', 187, NULL),
(217, 'xySKQQG4AxvLjVJtcPwJ4gCiu.jpg', 188, NULL),
(218, 'sR1O9ug2VZ1fr8YQjdsWd6t8a.jpg', 189, NULL),
(219, 'DYzgEMwimxOpUtzSLyWsT2rXa.jpg', 190, NULL),
(220, 'eboaIzNy8eN8D41wWG4W8HIDu.jpg', 191, NULL),
(221, 'cgcsRDkFPr63F99fSUwoYsobP.jpg', 192, NULL),
(222, '8yXYK1o3Xe4Zpk4GanxDy2MTI.jpg', 193, NULL),
(223, 'e6Wlgu0oNWTeCfGo9SsJVzHIk.jpg', 194, NULL),
(224, 'm7PeZvH5PZFdkFLama6S3zgOu.jpg', 195, NULL),
(225, 'KXubTtnKgSkUNu04O7tN7Dk8P.jpg', 196, NULL),
(226, 'QakpLrItX4fimBsWodPKua1J9.jpg', 197, NULL),
(227, 'ld9mkE4i0atMAWS7UTW8qoCsX.jpg', 198, NULL),
(228, 'CaupnKr4iY724NCT6ll0CI5jV.jpg', 199, NULL),
(229, 'eBqyrKpVtFpi8OeH6lLYcFLAu.jpg', 200, NULL),
(230, 'SXWrP12hPSSFHG2h7CoU9xPl5.jpg', 201, NULL),
(231, 'wXdF1cEXKthcFfXFKx5KEzgrw.jpg', 202, NULL),
(232, 'A40C1VQLXEQES6akmoXDXK49J.jpg', 203, NULL),
(233, 'RRvYhY688qevRKeCf5p4eFoR6.jpg', 204, NULL),
(234, 'ht1iogeWxOQ7h96qvILdgPGII.jpg', 205, NULL),
(235, 'TRifdDmT61vv5JlhEswhiJSkl.jpg', 206, NULL),
(236, 'X5blaxlnIDsj9VfuFU6SvaJUz.jpg', 207, NULL),
(237, 'TwhQydqqyszOyfyA9NF2Uptod.jpg', 208, NULL),
(238, 'gPFJPVqXq1jHlfdtmFLvd7wSN.jpg', 209, NULL),
(239, 'BSz9L6JoBoD87a5IxKZQQROsH.jpg', 210, NULL),
(240, 'XGDCbXRl0SzMhgHd8e1Rq3sSY.jpg', NULL, NULL),
(241, '0vc2kmPtYazQelQi6vUOR0ito.jpg', NULL, NULL),
(242, 'pb1H3bFfiCe6QG39RYYUNoAfQ.jpg', NULL, NULL),
(243, '0vTyfBL2oiAf3tKUd1UUWXua6.jpg', NULL, NULL),
(244, 'NClDJhbSA62AQVYqOmPN6GWGb.jpg', NULL, NULL),
(245, '1Jy8DyfB74y9tzh5jt9cW1koq.jpg', NULL, NULL),
(246, '2212uVtN3yQbRTQ7WsVhxlPw9.jpg', NULL, NULL),
(247, 'o82H9q7AtgmWrodJJoizbF4rA.png', NULL, NULL),
(248, 'gnSWlPFBVzms6RAFaOYMUcPqt.png', 211, NULL),
(249, 'nRQ8sjgVuWMFTox7VCMNtp73n.jpg', 211, NULL),
(250, 'OCXZ3iAz4ATodrIx1YL8pNrpr.jpg', 211, NULL),
(251, 'wPO09YkEcC3gR83rLB9520f7x.png', NULL, NULL),
(252, '8rTTdv4dPxtwGcQJozMlsDafW.png', NULL, NULL),
(253, 'fRCUuODUqiJBClJKA8qCPxmOi.png', NULL, NULL),
(254, 'voJxeYtuCjUIhsMwdCgh06DKJ.png', NULL, NULL),
(255, 'jbynvKt8xSfrJs0IJKFCIwdmw.jpg', NULL, NULL),
(256, 'G0LhdCsz7pAbdWoiLNoNCYvTK.jpg', NULL, NULL),
(257, 'ngbjiRf5ssTKqE1kqLPdzv01t.jpg', NULL, NULL),
(258, 'KLVr0LFT1UoUGFm4nhOvjQWWT.png', NULL, NULL),
(259, 'BmZmbqBkiDw865UxT1C2U5hmx.jpg', NULL, NULL),
(260, 'whQHe5LSur2Nf0aWwsHGjaIFc.jpg', NULL, NULL),
(261, 'GOsT0zF1qCSy0XWt5f6Mrfsgz.jpg', 212, NULL),
(262, 'Sj4xCHZiAOBeq41HtdBC2CuwB.jpg', NULL, NULL),
(263, 'UKdh5RfqCaDvzaMqtVWGxA8OR.jpg', NULL, NULL),
(264, 'heXvjGPQswYyuumaFzbQHEWyE.jpg', NULL, NULL),
(265, '5NgOpv9ynh0ZxCggYTlWKWTMV.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `listaspesa`
--

CREATE TABLE `listaspesa` (
  `idListaSpesa` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Descrizione` varchar(140) DEFAULT NULL,
  `CategoriaLista_idCategoriaLista` int(11) NOT NULL,
  `Immagini_idImmagini` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `listaspesa`
--

INSERT INTO `listaspesa` (`idListaSpesa`, `Nome`, `Descrizione`, `CategoriaLista_idCategoriaLista`, `Immagini_idImmagini`) VALUES
(12, 'Festa della Laurea', 'cibo e bevande per la mia festa di laurea del 2000 e mai', 3, 255),
(13, 'Cose per la casa', 'quello che mi serve per l\'appartamento a trento', 4, 256),
(14, 'Festa in baita del 12/01', 'occorrente per festeggiare la consegna del progetto', 3, 257),
(15, 'Roba per la tunisia', 'regali da portare in traghetto', 6, 258),
(16, 'Materiale per il cus', 'oggetti per le stagione', 6, 259),
(17, 'Lista per la palestra', 'cose che mi servono per allenarmi', 6, 260),
(18, 'Juve - Chievo', 'Occorrente per la partita della juve', 3, 262),
(19, 'Cena pesce', 'pesce per la cena con gli amici', 3, 263),
(20, 'Regalo comagni campo vecchio', 'ringraziamento premio miglior marcatore della stagione scorsa', 5, 264),
(21, 'Spesa papa\'', 'lista per la casa', 5, 265);

-- --------------------------------------------------------

--
-- Struttura della tabella `listaspesa_has_prodotto`
--

CREATE TABLE `listaspesa_has_prodotto` (
  `ListaSpesa_idListaSpesa` int(11) NOT NULL,
  `Prodotto_idProdotto` int(11) NOT NULL,
  `checked` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `listaspesa_has_prodotto`
--

INSERT INTO `listaspesa_has_prodotto` (`ListaSpesa_idListaSpesa`, `Prodotto_idProdotto`, `checked`) VALUES
(12, 31, 0),
(12, 33, 0),
(12, 37, 1),
(12, 41, 1),
(12, 45, 0),
(12, 47, 0),
(12, 49, 0),
(13, 51, 0),
(13, 60, 0),
(13, 116, 1),
(13, 118, 0),
(13, 210, 0),
(14, 11, 0),
(14, 41, 0),
(14, 42, 0),
(14, 43, 0),
(14, 44, 0),
(14, 45, 0),
(14, 46, 1),
(14, 48, 0),
(14, 97, 1),
(14, 168, 0),
(14, 201, 1),
(15, 117, 0),
(15, 125, 0),
(15, 128, 1),
(15, 195, 0),
(15, 204, 1),
(16, 46, 1),
(16, 161, 0),
(16, 163, 0),
(16, 165, 0),
(16, 177, 1),
(17, 160, 0),
(17, 167, 1),
(17, 179, 0),
(17, 212, 0),
(18, 33, 0),
(18, 45, 1),
(18, 46, 0),
(18, 48, 1),
(18, 49, 0),
(18, 113, 0),
(19, 22, 0),
(19, 26, 1),
(19, 33, 0),
(19, 35, 0),
(19, 42, 0),
(19, 43, 1),
(19, 45, 0),
(19, 51, 0),
(19, 53, 0),
(19, 56, 0),
(19, 97, 0),
(20, 12, 0),
(20, 72, 0),
(20, 73, 1),
(20, 74, 1),
(20, 75, 0),
(20, 76, 0),
(20, 79, 0),
(20, 80, 0),
(21, 46, 0),
(21, 53, 1),
(21, 54, 0),
(21, 120, 0),
(21, 142, 1),
(21, 150, 0),
(21, 156, 1),
(21, 201, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `logo`
--

CREATE TABLE `logo` (
  `idLogo` int(11) NOT NULL,
  `Indirizzo` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `logo`
--

INSERT INTO `logo` (`idLogo`, `Indirizzo`) VALUES
(57, '092JvRDP1rx0QUUFyzlOkBRDb.jpg'),
(39, '0AgZ3GzJyqhRZc8UsBueWCS1E.png'),
(92, '0ajgpoFO5q6cKPuC7gs11OCf0.png'),
(154, '155laP3WQlgkScxBTbSIOXgG7.png'),
(230, '1b0lASaOcMcTHYSQuus1JWTGI.png'),
(85, '1bwrefcbKKeh84PzJSiPd0tkF.jpg'),
(218, '1ejRn5zBIjizd3Z1u5RkX3BLE.png'),
(153, '1htU0ShOwEM59BCBeoth8Utna.png'),
(160, '1IrMAXGHq4MsOZPEE5EoIbQtv.jpg'),
(164, '1JQtxTk7mnovaxoW7lootAKXf.png'),
(152, '2O7MQ1WSfEdtjG4AhYO0UPEDm.png'),
(121, '31y9zVzfF1Ur3QW3oIFIXHb2N.jpg'),
(59, '3K9fJsNHAzucGYtbEJidu8L2K.jpg'),
(73, '3Kc7m5nc87gxsVX8KjzQr9U9a.jpg'),
(38, '3tkNJCWHC0O6HmLugCnR4oulX.jpg'),
(167, '3Y38zEwvuwDsh0VK3Vs43OsXI.png'),
(81, '46GwGGaidv5VzhSU31fMLwtfq.jpg'),
(66, '4GtQJdJ5FK1lM62H5nUQLbCwa.jpg'),
(20, '4lNaW1PhnLtYw44TdJThWC2BU.jpg'),
(86, '4NNSD4itA8P6RjuntpDMgp0np.jpg'),
(143, '4UCPQ0YCd4IzNQx8DAuZS1dHM.png'),
(219, '4vP5GygvXtgJDl39V2FwjpKQw.jpg'),
(204, '5eNEbiwKTo2TkgglKjn6vvBb0.png'),
(65, '5jwhPyhCRPyhxzGakOFlA0MrJ.jpg'),
(136, '5N4nLwqob1uDX54Kx0VI9gMXB.jpg'),
(120, '5UOt73Fhj7B8IkM2Apq2gABzU.jpg'),
(115, '62dJc3B4krf88XZRHXaC0208M.jpg'),
(197, '6OUzEKES3uAXuziqIaK0bxF0H.png'),
(208, '6X3tcnDRLotxLSXBoxpf9p0Gv.png'),
(83, '77FgM4IfPsY4uG2uRN5QbzrdU.jpg'),
(18, '7BAvXmPyhOrDXsZMGTckOKUmO.jpg'),
(26, '7Vq37XtC6lOwKW343a5DuYAZ1.jpg'),
(213, '7Y2278sHaMSM6Nb9J0Xjzy1VM.jpg'),
(215, '7Z6ZPYQpuNmq4r4kbAsPji9QF.jpg'),
(168, '87FRNlfBo2KNoiYEKfdg7cA4O.png'),
(211, '8CRh4qpgvBCntji3BrXlXo9Pk.jpg'),
(188, '8dCcJj8dYKC5oGQA0gKu061PH.png'),
(180, '8E8y1DQS9KaK0nC669bO5C1QL.png'),
(225, '8l8VhRDMbBAx6oMHSWCngZ1IE.png'),
(47, '8WeqwTqD1BQ61aiHJGSJBwyG8.png'),
(222, '9MI4r62PioGMkv224TTaebYmR.png'),
(237, '9S1KdUz7A2SZurFJxr74Ii2Dv.png'),
(235, '9tB5PCvUbo3zyHhsUGf10tGOY.png'),
(232, '9WnMLTHClFcime5esBQq9fdUE.png'),
(119, '9yUlEZFX4gQG4ihQ8nBrAx6Ya.jpg'),
(108, 'abK2H7zpJGYpeY4CHOjDXYG90.png'),
(179, 'AkRsUdP4JVkR91N3TufBb85PP.png'),
(231, 'aWIx85dr1F3AWI1RiRGKuxbmX.png'),
(45, 'b4pBttGsaULvQi7N9vuDsAqM3.jpg'),
(28, 'bDZXtm6XI6Eg252CFUjRhNhC7.jpg'),
(22, 'BftePbA5WZvgUtXJJaiEJYPvg.jpg'),
(165, 'bI3dZr3dik8SiujaICd97DIwm.png'),
(163, 'Bqll7zaEa19kLrYMjASm8hA4u.png'),
(62, 'BWZMrVp9V3igTtiSJBtCQLRGE.jpg'),
(110, 'BxuWuoW5yYEb3olK47jMM4Cqd.png'),
(76, 'bztoEM4YAp1RySXszHeYDuk6Z.png'),
(79, 'cbFCI3M4rcTmFmGv8znPmwsDx.jpg'),
(61, 'Ce51aQN1KYtvOh8mkmMSUC4Fg.png'),
(127, 'Cj0InZ1q07cPspIX52ICVezyk.jpg'),
(229, 'ckEKvlPyMUzDY7NBwNCkucUXr.jpg'),
(40, 'CljA8nXvnYjzD066BEuQQ1ccn.jpg'),
(236, 'CVqTOzmpiEWFtFRKB0sZwxiVv.png'),
(24, 'cW6imAyMz9xZAOHPxViocruPS.jpg'),
(95, 'CzCyNxrJoRaXOTqI5FvpJvvtc.jpg'),
(44, 'dB3h9eZ3c1cTfLXPQ4VVwkOBs.jpg'),
(90, 'DdTHM81ExQY5b5FW86cmGs3WG.png'),
(192, 'dMHwTkwwWLtkJ9DhiNcAYRybj.jpg'),
(227, 'dqJMB5iUxddLARAEvTD6zi83o.png'),
(175, 'dwIYahmf1TPfqIKPbSZS9ohSa.png'),
(15, 'e4PU6zjkZfjxz1CiIxIXkBNWN.jpg'),
(98, 'e5ChbFHIBVMIFFbTaEL474Qck.png'),
(177, 'eBZg58Poz94bznvuRaSEd38uy.png'),
(158, 'EE33OssEaFkKdE2WivHDiTSsE.png'),
(31, 'EF1NmEJu51BI6xmemznPYEpS9.jpg'),
(88, 'elYY8vF9bnBAOoAkk25cq2Gmn.png'),
(214, 'EN6hS5kxMScTZ3W0tm8KpYHCi.png'),
(107, 'EogNqPrqKFueMyCobtwxlekbD.jpg'),
(58, 'eoZCduvUq3kyZlYrH8iFgMaD4.jpg'),
(72, 'ErhUneXlf8rd2a1vSKguYrVWK.png'),
(187, 'ErKnb8H0U2RYKgPO5YJqTV4D8.png'),
(234, 'ESmsfQVg2XRcHpVQt6DbtQqEs.png'),
(199, 'fdJEew5pcltwqpzQNeqe3vynH.png'),
(141, 'fkE8hk8r2SCILzgDLvcQ1hxXY.png'),
(195, 'fm5gB87YclPLPqesG9DBTeB9S.png'),
(150, 'FoEbNUIUzNN8KYlnSFu7sT5ii.jpg'),
(186, 'FspQl3h4ssAEO72uPpaItLk96.png'),
(29, 'FtsDoxigzZ3yGc3t3bLgQUFOc.jpg'),
(207, 'FUbBLOhurwzgFeF7HOgKVceeC.png'),
(54, 'FvaUQTrnjTGu3STP1xILj3VN8.png'),
(112, 'G0MgteumbPwkSJ3QpjZc3iRAm.jpg'),
(140, 'gAtqfCm7uYySopKEZf3euPOvy.png'),
(19, 'gdXnurtExQ0ihoLIbcNewMkm9.jpg'),
(190, 'gob6C4owWXVFwU5bezughjJYB.jpg'),
(89, 'gqk7xhX0TaanfYnzfl7c5LX1J.png'),
(138, 'gW3axyfMKsIlcEgCpAjWXfxz9.png'),
(50, 'h2rJUFWYJiorllKrKSCodD9bm.png'),
(122, 'HgO9H26608Q30djuJS5Fms1D2.jpg'),
(189, 'hxSbpGy79odRzmfrBJ3lucmpf.jpg'),
(106, 'i2221LSLe8EkCR6M6PYhnBEht.jpg'),
(202, 'i3VQd4CntFkMKGxhQ7sZa2rAU.png'),
(67, 'ibH3Ky9iYfJfD4zQhTNkO8XQ6.jpg'),
(100, 'IDpc5dPelEJQImohyTH96RXcL.png'),
(172, 'IDPdxIxJZBfIb0jchwkqsMqW5.png'),
(233, 'IhkjSqr5Lw8TWfdJ5Vd5HRGLD.png'),
(170, 'ImFmmiDyyUbOKQwZYEDQ69Tp2.png'),
(242, 'iMGBftfV5jSSEYg938njSTUWa.png'),
(226, 'iR5ZIjii0GzaHKOAxfRaNHdu8.png'),
(145, 'iS7rkplAOuGIPk80HFZLg3KUK.png'),
(132, 'iuFna4TaPGpxz9Mh7g2OVeyrL.jpg'),
(91, 'JDcPFX2yLG8Kj1gfctZpETimD.png'),
(130, 'jdl0L0iHb0ibIszxGO32PcWDX.jpg'),
(156, 'JHyNDPt4IMVxx1wyGIBbbAo3s.png'),
(105, 'jKHieED1N9M3iEu4XPGJBFm3s.jpg'),
(78, 'JweoB2RVn9SRUqPm5zAdA22w4.jpg'),
(238, 'K619u5ceAwy0BXRni5ZtRFlEp.jpg'),
(209, 'KaaTqVj87kqcL8sMpkj1OraGn.png'),
(84, 'KC1s7c2D0B0tro0hBS22iWWv5.jpg'),
(146, 'Km1K6RoGnNSwuu9rdhd2mH8yV.png'),
(216, 'L5mWfqrULubR4q1djAuecT88t.jpg'),
(148, 'lHSjZgaLbQLNUIYtikJ64N6kl.jpg'),
(33, 'LIUOgUB8eHDv67zlnSE5YEMie.jpg'),
(201, 'lQue7LVXkS4Mdz78FynH1zkdW.png'),
(70, 'LxYeoTVlLMaZTJSEus9eNsbsa.png'),
(196, 'lZtUW5xtbyChgXMJLg26ieNBf.png'),
(217, 'M4ht7ZBxrALbf3bmaWVGMynsy.png'),
(99, 'm51WA5aIezgjPPMTw7CS7alws.jpg'),
(71, 'm58dXtzGgImWbot3lzVyvCnP2.png'),
(82, 'mCfFJeGenSKJVsMvZrezHwUwk.jpg'),
(102, 'mhasIvAvqDNknZAW5fhRiQsqH.jpg'),
(68, 'mjjhS1IIIDokW9KvdLg9Ccmnn.png'),
(161, 'mLYhOvH5ttELHcimBRedgkyT3.jpg'),
(128, 'MvhguDOH16m6QVAVUC8dq4b79.jpg'),
(241, 'MXNSrwD61gOKbZgo8wCM41SPC.png'),
(35, 'N4Jd9jrU2Z7xE5bukpAIYMRs1.jpg'),
(74, 'nCvVZR12VKHh6RQux9KVo16Gz.png'),
(135, 'nLCmFPkao3kvJZyh178Ab0Glh.jpg'),
(194, 'nUhSFtYOjtKXeFqeg1TObL3g3.png'),
(53, 'NVvrPxzjxHxYBamB0WwlA41x1.png'),
(23, 'nVZrtjr1iPluQp9sdjuCWOxzy.jpg'),
(131, 'NZraDRBVUo9Y3PI7BhF9V4hlE.jpg'),
(139, 'OBHkXWkhmGvCobNjJ8iqeWfrk.png'),
(184, 'ONlV6tNpWu72VPRClgiUP8tMl.png'),
(166, 'oOk12tSiJ0OrnQK2yqTvc0B4h.png'),
(27, 'OTUFeLhyHoJDS12Ce1zK7teDU.jpg'),
(183, 'OZRXzH2qKNexpSfljqFHlKRC9.png'),
(176, 'oZxvDsiXOtzXNOHx6y2UGJjMb.png'),
(239, 'P2KTyXPyP4lWYX8UoqI5HNPOW.png'),
(159, 'PBOZ31cGicIo1ORzN8O0by72X.jpg'),
(75, 'pdbjUVPKLO5G8VHG0hxeWsYkg.jpg'),
(221, 'PdPYSN4Fnoc2sFeksY6odOYNg.png'),
(162, 'PdQIMpxelyMT8XpYzDtocJHf9.png'),
(37, 'PetEdjYmkypIVR7tOF0L9kKHf.jpg'),
(240, 'pmlz95b4MTvorcy9ou4FaJBj3.png'),
(51, 'puyV9jbLcBp1b1x7i7MzLHdCH.png'),
(16, 'pvgpCvp32zYN5I984eHZJ7kKJ.jpg'),
(87, 'qaGs54LqlZieM9tVgZaOmseKW.png'),
(200, 'qiCDRdCoOGViSAvmBoKeJvCKp.png'),
(129, 'qqW9ewC5HJu291NEf435HIbVz.jpg'),
(223, 'QTTADt3aWWuPH6q57pnCCLbrw.jpg'),
(203, 'QuCzJHIMf4KzRNTohZT37Mlci.png'),
(113, 'qvZcy8pK0D0k83nZNmIhMNXJo.jpg'),
(157, 'r25v0RYCk6LV5PUWETY2w00HJ.jpg'),
(224, 'RASKWxiwmAxpTb9XTZxPvmfBk.jpg'),
(126, 'RE4foAchVkwroPhKfoaLKzSJi.jpg'),
(212, 'RhaUkeweT6RUbhxUakWZKRCXh.jpg'),
(94, 'RIfJRfsIYY8so2IcrmIy9KsUA.jpg'),
(60, 'rnN38Aiwp5cwkFGfquYEPLW3g.jpg'),
(124, 's1OdvVAVr8aoq9LHtoXyXRtys.jpg'),
(198, 'sATQlRKJjI0XL4l1P8p1BJiLU.png'),
(142, 'sB57Ta1CKJGAzIxFqgHlKrLj9.png'),
(185, 'sdRuRSN5DkDdGwCLzXx5tnl3X.png'),
(137, 'slzDfxH5LQN5j7HuoJ71vTz9o.jpg'),
(55, 'Sn86RoDFpU57t1EbV7vcdAMcp.png'),
(96, 'sRxsEvz6Fq40wudIoJ25yjPdH.jpg'),
(97, 'SsEeaWcoMEE4e9uKQM5WJbh68.png'),
(25, 't1p5QcyAGhWBHsfqS41GEpKCi.jpg'),
(182, 'TAs5UT3u9aKRb6wVxBx77l8YP.png'),
(48, 'TdK37BXukhb275fYo8Zvt0T0u.png'),
(52, 'tDP2EovyI1Vu2bvTfcgkEfyXv.png'),
(104, 'TIgKy63t9gpZKBV2KMIKQX3u8.jpg'),
(193, 'tMj8Q6sUbCUd15BiBuqp834Mx.png'),
(144, 'TQ7WMgosJPXKQ7gZqp2JMfmBE.png'),
(114, 'tq9HZBx6o8eHz9QEycCFuw5Kd.jpg'),
(169, 'TuqxeOI5uTUKeggpX93Rr9uvs.png'),
(206, 'U3gfBJSCzClkHbkPHEh1r0qtH.jpg'),
(111, 'u7Yox57UqFKKjTMxVMjyulpr2.png'),
(149, 'UazxXMz3a4YXoQ35C6PA8Tpud.jpg'),
(205, 'uGK55uymIJxtJOaembFrKTU2g.jpg'),
(93, 'uLdjzRVz9lhxFvDcxLtP37WEn.jpg'),
(80, 'V1yIwoejLOJWdseRgXaoyMo4T.jpg'),
(171, 'v3JXdxcPviVek9J7O7thyyszm.png'),
(69, 'V4ChMr19dbs9EAlsRMJcITMlp.jpg'),
(63, 'v7Bdifcj2GBCScKgfYNbwgkTN.jpg'),
(116, 'VAQsrRxhA6Qa1j73WxKzN9vwx.png'),
(151, 'vDdYKywUqNNTzZBlqQMiFuA6M.jpg'),
(103, 'vFmtnmCW8WjWwRN2GnNnGLFln.jpg'),
(117, 'vgrgY7r3tH22wZIkT6oOrCbqY.jpg'),
(178, 'VImO5FCqW2u0BwGZyNgJk7gF8.png'),
(220, 'VPHinGzel09i8XQc0syKXnHjd.jpg'),
(30, 'vxfZu7eUMpBAR6c53rewBpUyN.jpg'),
(49, 'vXGLO8Yog59LcCViKVUblyAUz.png'),
(134, 'WboT9RKfs08IFpa9UxrxAX9cd.jpg'),
(125, 'WhQGACjPhxJWo59HLC0spctST.jpg'),
(109, 'wkZSOT2NnV0gUqf8Gg6lUwdpP.png'),
(43, 'WMfhqnIU1HUpbw9ys1N20ISz9.jpg'),
(41, 'wnHdf2AXqftxGkRGZLq1bQ6XV.jpg'),
(228, 'Ww23b0rwUCT4mOshVNuegj08N.png'),
(101, 'x0cyilNZtN41s3fYlWRD3BX1j.jpg'),
(118, 'x5o63sLHDxnugEE9WFgGenJxI.jpg'),
(173, 'XaxvANvVztlAfNZn2bCk5CyPR.png'),
(77, 'xbvLu9iS6uPbqw1f6624SWMem.jpg'),
(36, 'XC5uZHhFxMWnHEWPmr1j4unJH.jpg'),
(34, 'xDRDeizahhCqFnXFtMtBnIGPy.jpg'),
(21, 'xjgeDTnosElyFxRCJ8JyaacYH.jpg'),
(32, 'XNjx01n2G2obbatn4isl9apVZ.jpg'),
(56, 'xO8mFeZA8QjfxRjhgwYWjsqow.png'),
(64, 'XrUYyKGDrM7AFk5AN6anDIOJh.png'),
(42, 'y7cVOjPezOUQSSY1pa4n9Ur2n.jpg'),
(191, 'YIRfSx1cthshkl5OGKzn6Herm.jpg'),
(210, 'ymGYI4YGVQVcAdwuj4sc54PfX.jpg'),
(155, 'YWE6Ds6REHzJ12hBatjcSC1sl.png'),
(174, 'z6tj92noqEi1vJNreWk2SaXp5.png'),
(133, 'z8h7o8SnFTm2aIOax5vRouT4l.jpg'),
(46, 'zLXu2dJZRciKcAUmwmYYFzIQd.jpg'),
(123, 'zuF9KfKIYs70vrMmpzj1N9Htn.jpg'),
(181, 'ZukbyCXmkF8ZcG7Ufm9cvhdOo.png'),
(17, 'Zx9C6VCz24ITmDZu7n70HEf8r.jpg'),
(147, 'zzMGXu1VYfeWdZ0Zmw8ylKKKN.png');

-- --------------------------------------------------------

--
-- Struttura della tabella `messaggio`
--

CREATE TABLE `messaggio` (
  `idMessaggio` int(11) NOT NULL,
  `messaggio` varchar(140) NOT NULL,
  `Utente_idUtente` int(11) DEFAULT NULL,
  `ListaSpesa_idListaSpesa` int(11) DEFAULT NULL,
  `oraInvio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto`
--

CREATE TABLE `prodotto` (
  `idProdotto` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Note` varchar(140) DEFAULT NULL,
  `CategoriaProdotto_idCategoriaProdotto` int(11) NOT NULL,
  `Logo_idLogo` int(11) NOT NULL,
  `idLista` int(11) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`idProdotto`, `Nome`, `Note`, `CategoriaProdotto_idCategoriaProdotto`, `Logo_idLogo`, `idLista`) VALUES
(11, 'Mele', 'mele del trentino', 2, 37, -1),
(12, 'Banane', 'banane chiquita', 2, 38, -1),
(13, 'Radicchio tardivo', 'raddicchio di castelfranco tardivo', 2, 39, -1),
(14, 'Limoni siciliani', 'limoni siciliani igp', 2, 40, -1),
(15, 'Arance', 'arance siciliane igp', 2, 41, -1),
(16, 'Patate', 'patate di rotzo', 2, 42, -1),
(17, 'Uva', 'uva di valdobbiadene', 2, 43, -1),
(18, 'Cavolfiore', 'cavolfiore del sudtirol', 2, 44, -1),
(19, 'Pomodorini', 'pomodori san Marzano', 2, 45, -1),
(20, 'Cipolla', 'cipolla di tropea', 2, 46, -1),
(21, 'Lasagne', 'lasagne al forno senza glutine', 3, 47, -1),
(22, 'Patate al forno', 'patate al forno intere con rosmarino', 3, 48, -1),
(23, 'Insalata russa', 'insalata russa senza peperoni', 3, 49, -1),
(24, 'Pollo allo spiedo', 'pollo allo spiedo allevato a terra', 3, 50, -1),
(25, 'Verdure girgliate miste', 'misto verdure melanzane e peperoni  e zucchine', 3, 51, -1),
(26, 'Branzino al forno', 'branzino al forno con limone', 3, 52, -1),
(27, 'Gnocchi', 'gnocchi freschi al banco', 3, 53, -1),
(28, 'Spezzatino', 'spezzatino di bovino con sugo', 3, 54, -1),
(29, 'Polpette', 'polpette di verdure e carne fritte', 3, 55, -1),
(30, 'Frittura di mazzamma', 'pescolini fritti', 3, 56, -1),
(31, 'Pizza ', 'pizza ristorante', 4, 57, -1),
(32, 'Sofficini', 'sofficini findus senza lattosio', 4, 58, -1),
(33, 'Fish Burger', 'fish burger findus', 4, 59, -1),
(34, 'Bastoncini', 'bastonicini findus', 4, 60, -1),
(35, 'Patate fritte', 'patate fritte coop', 4, 61, -1),
(36, 'Patate fritte', 'patate fritte findus', 4, 62, -1),
(37, 'Patate fritte', 'patate fritte pizzoli', 4, 63, -1),
(38, 'Pizza', 'pizza coop con bufala', 4, 64, -1),
(39, 'Pizza', 'pizza viviVerde coop con kamut', 4, 65, -1),
(40, 'Minestrone di verdure', 'minestrone di verdure vivaVerde coop', 4, 66, -1),
(41, 'Montenegro', 'amaro montengro 100cl', 5, 67, -1),
(42, 'Amaro lucano', 'amaro lucano 100 cl', 5, 68, -1),
(43, 'Amarone ', 'amarone della valpolicella 75cl', 5, 69, -1),
(44, 'Cabernet', 'cabernet souvignon 75cl', 5, 70, -1),
(45, 'Prosecco', 'prosecco breganze 75cl', 5, 71, -1),
(46, 'Birra', 'birra heineken', 5, 72, -1),
(47, 'Birra', 'birra pedavena ', 5, 73, -1),
(48, 'Birra', 'birra ceres', 5, 74, -1),
(49, 'Birra', 'birra faxe', 5, 75, -1),
(50, 'Birra', 'birra forst', 5, 76, -1),
(51, 'Trota', 'trata di fiume', 6, 77, -1),
(52, 'Salmone', 'salmone norvegese selvatico', 6, 78, -1),
(53, 'Branzino', 'branzino sudafricano', 6, 79, -1),
(54, 'Trota salmonata', 'trota salmonata da allevamento', 6, 80, -1),
(55, 'Tonno', 'tonno atlantico', 6, 81, -1),
(56, 'Pesce spada', 'pesce spada allevato', 6, 82, -1),
(57, 'Vitello di mare', 'vitello di mare decongelato', 6, 83, -1),
(58, 'Mazzancolle', 'mazzancolle indiane', 6, 84, -1),
(59, 'Scampi', 'scampi da cuocere in pentola', 6, 85, -1),
(60, 'Balena', 'trancio di balena da fare ai ferri', 6, 86, -1),
(61, 'Decespugliatore', 'decespugliatore greenworks batteria', 7, 87, -1),
(62, 'Tagliaerba', 'tagliaerba greenworks batteria', 7, 88, -1),
(63, 'Motosega', 'motosega greenworks batteria', 7, 89, -1),
(64, 'Spazzafogliame', 'spazzafogliame greenworks batteria', 7, 90, -1),
(65, 'Canna acqua', 'canna acqua greenworks', 7, 91, -1),
(66, 'Tagliasiepi', 'tagliasiepi greenworks batteria', 7, 92, -1),
(67, 'Sparachiodi', 'sparachiodi maurer', 9, 93, -1),
(68, 'Forbici da brusca', 'forbici taglia rami maurer', 7, 94, -1),
(69, 'Forbici rifinisci giardino', 'forbici rifinisci giardino maurer', 7, 95, -1),
(70, 'Casco protettivo', 'casco con rete antinsetti e cuffie antirumore', 7, 96, -1),
(71, 'Rastrello', 'rastrello strocker', 7, 97, -1),
(72, 'Morsetto', 'morsetto per legni dolci', 9, 98, -1),
(73, 'Lima', 'lima maurer per legni scuri', 9, 99, -1),
(74, 'Lama sega', 'lama ricambio sega stocker 35cm', 9, 100, -1),
(75, 'Sega', 'sega maurer 25cm', 9, 101, -1),
(76, 'Seghetto', 'seghetto maurer con lama ricambio', 9, 102, -1),
(77, 'Archetto da traforo', 'archetto da traforo maurer ', 9, 103, -1),
(78, 'Trapano a colonna', 'trapano a colonna da pavimento fox', 9, 104, -1),
(79, 'Trapano a colonna', 'trapano a colonna da banco fox', 9, 105, -1),
(80, 'Sega circolare', 'sega circolare fox da banco', 9, 106, -1),
(81, 'Malta', 'malta per muratura', 8, 107, -1),
(82, 'Casco protettivo', 'casco di sicurezza cantiere kapriol', 8, 108, -1),
(83, 'Mattone', 'mattone forato', 8, 109, -1),
(84, 'Mattone', 'mattone pieno', 8, 110, -1),
(85, 'Mattone', 'mattone refrattario', 8, 111, -1),
(86, 'Bolla', 'bolla per verificare l inclinazione del terreno', 8, 113, -1),
(87, 'Cemento', 'cemento bianco maurer', 8, 114, -1),
(88, 'Cemento', 'cemento rapido maurer', 8, 115, -1),
(89, 'Silicone', 'cartuccia silicone soudal', 8, 116, -1),
(90, 'Pistola silicone', 'psitola silicone con tubo maurer', 8, 117, -1),
(91, 'Ravanello', 'ravanello blumen', 10, 118, -1),
(92, 'Cappero', 'cappero blumen', 10, 119, -1),
(93, 'Cicoria', 'cicoria blumen', 10, 120, -1),
(94, 'Lattuga', 'lattuga da taglio blumen', 10, 121, -1),
(95, 'Fagiolini', 'fagiolini nani trofeo', 10, 122, -1),
(96, 'Rucula', 'rucola blumen', 10, 123, -1),
(97, 'Piselli', 'piselli nani grano liscio blumen', 10, 124, -1),
(98, 'Soia', 'soia verde blumen', 10, 125, -1),
(99, 'Zucchino', 'zucchino verde di milano blumen', 10, 126, -1),
(100, 'Alisso', 'alisso giallo blumen', 10, 127, -1),
(101, 'Doccino', 'doccino zincato classico', 11, 128, -1),
(102, 'Doccino', 'doccino zincato colorato', 11, 129, -1),
(103, 'Doccino', 'doccino zincato con buco', 11, 130, -1),
(104, 'Doccino', 'doccino zincato tubolare', 11, 131, -1),
(105, 'Rubinetto', 'rubinetto classico', 11, 132, -1),
(106, 'Rubinetto', 'rubinetto moderno', 11, 133, -1),
(107, 'Rubinetto', 'rubinetto con tubo a u', 11, 134, -1),
(108, 'Rubinetto', 'rubinetto classico con doppia manopola', 11, 135, -1),
(109, 'Tubo', 'tubo a pressione', 11, 136, -1),
(110, 'Tubo', 'tubo flessibile', 11, 137, -1),
(111, 'Tv curvo', 'Tv curvo samsung hdr1000', 12, 138, -1),
(112, 'Tv curvo', 'Tv curvo oled lg', 12, 139, -1),
(113, 'Tv curvo', 'tv curvo sony what gear', 12, 140, -1),
(114, 'Tv 50 pollici', 'tv sony 50 pollici', 12, 141, -1),
(115, 'Tv 50 pollici', 'tv 50 pollici flat samsung', 12, 142, -1),
(116, 'Tv 50 pollici', 'tv 50 pollici hisense special world cup', 12, 143, -1),
(117, 'Tv 50 pollici', 'tv 50 pollici lg', 12, 144, -1),
(118, 'Tv 32 pollici', 'tv 32 pollici lg', 12, 145, -1),
(119, 'Tv 32 pollici', 'tv 32 pollici sony', 12, 146, -1),
(120, 'Tv 32 pollici', 'tv 32 pollici samsung', 12, 147, -1),
(121, 'Iphone', 'iphnoe xr', 13, 149, -1),
(122, 'Iphone', 'iphone 4 16gb', 13, 150, -1),
(123, 'Iphone', 'iphone 8 64gb', 13, 151, -1),
(124, 'Oneplus', 'oneplus 3 256gb nero', 13, 152, -1),
(125, 'Oneplus', 'oneplus 5 64gb carbon', 13, 153, -1),
(126, 'Oneplus', 'oneplus 6 128gb', 13, 154, -1),
(127, 'Google Pixel', 'google pixel 2 64gb black', 13, 155, -1),
(128, 'Google Pixel', 'google pixel 3 128gb black', 13, 156, -1),
(129, 'Huawei p20', 'huawei p20 pro', 13, 157, -1),
(130, 'Nokia', 'nokia 3310', 13, 158, -1),
(131, 'Macbook', 'macbook pro 2018', 14, 159, -1),
(132, 'Macbook', 'macbook pro', 14, 160, -1),
(133, 'Macbook', 'macbook air', 14, 161, -1),
(134, 'Asus notebook', 'asus zenbook 13 pollici', 14, 162, -1),
(135, 'Asus notebook', 'asus vivobook 15.6 pollici', 14, 163, -1),
(136, 'Asus notebook', 'asus e series', 14, 164, -1),
(137, 'Acer notebook', 'acer aspire 7 15.6 pollici', 14, 165, -1),
(138, 'Acer notebook', 'acer swift 7 13 pollici', 14, 166, -1),
(139, 'Acer notebook', 'acer swift 5 pro 14 pollici', 14, 167, -1),
(140, 'Lenovo notebook', 'lenovo yoga 730 13 13.3 pollici', 14, 168, -1),
(141, 'Console xbox one', 'xbox one 500gb + kinect', 15, 169, -1),
(142, 'Ps4', 'ps4 pro 1tb + gran turismo 5', 15, 170, -1),
(143, 'Console Nintendo Switch', 'console nintendo switch blu/rosso', 15, 171, -1),
(144, 'Gta 5', 'gta 5 per ps4', 15, 172, -1),
(145, 'Gta 5', 'gta 5 per xbox', 15, 173, -1),
(146, 'Assasin Creed Unity', 'assasin creed unity per xbox', 15, 174, -1),
(147, 'Assasin Creed Unity', 'assasin creed unity per ps4', 15, 175, -1),
(148, 'Fifa 19', 'fifa 19 per ps4', 15, 176, -1),
(149, 'Fifa 19', 'fifa 19 per xbox', 15, 177, -1),
(150, 'Fifa 19', 'fifa 19 per pc', 15, 178, -1),
(151, 'Auricolari sennheiser', 'auricolari sennheiser CX Sport In Ear Wireless', 16, 179, -1),
(152, 'Auricolari sennheiser', 'auricolari sennheiser MX 365', 16, 180, -1),
(153, 'Auricolari sennheiser', 'auricolari sennheiser CX275S', 16, 181, -1),
(154, 'Cuffie Sennheiser', 'cuffie sennheiser HD 4.40 Wireless', 16, 182, -1),
(155, 'Cuffie Sennheiser', 'cuffie sennheiser HD 201', 16, 183, -1),
(156, 'Auricolari beats', 'auricolari UrBeats Monster BEATS', 16, 184, -1),
(157, 'Auricolari beats', 'auricolari Ibeats Control Talk', 16, 185, -1),
(158, 'Auricolari bose', 'auricolari bose Â® SoundSport Â® In-Ear', 16, 186, -1),
(159, 'Cuffie Beats', 'cuffie beats by dr. dre Beats Studio3', 16, 187, -1),
(160, 'Cuffie Bose', 'cuffie Bose QuietComfort 35', 15, 188, -1),
(161, 'Guanti portiere', 'guanti portiere prisma pro nero/gialli', 17, 189, -1),
(162, 'Guanti portiere', 'guanti portiere supreme g3 arancio/blu', 17, 190, -1),
(163, 'Gomitiere portiere', 'gomitiere kevlar nere', 17, 191, -1),
(164, 'Guanti portiere', 'guanti portiere sala arancio/gialli/blu', 17, 192, -1),
(165, 'Pallone Agla', 'pallone agla futsal', 17, 193, -1),
(166, 'Scarpe Agla', 'scarpe agla condor indoor', 17, 194, -1),
(167, 'Pallone calcio', 'pallone nike merlin serie A', 17, 195, -1),
(168, 'Pallone calcio', 'pallone nike merlin premier league', 17, 196, -1),
(169, 'Scarpe calcio', 'scarpe calcio nike magista grigio/azzurro', 17, 197, -1),
(170, 'Scarpe calcio', 'scarpe calcio nike magista rosso/nero', 17, 198, -1),
(171, 'Scarpe', 'scarpe volley mizuno uomo wave lightning z4', 18, 199, -1),
(172, 'Scarpe pallavolo', 'scarpe mizuno pallavolo donna azzurro', 18, 200, -1),
(173, 'Pallone pallavolo', 'pallone pallavolo mva200 serie A', 18, 201, -1),
(174, 'Pallone pallavolo', 'pallone pallavolo mva200', 18, 202, -1),
(175, 'Rete pallavolo', 'rete pallavolo BV100 THE WIZ NET gialla', 18, 203, -1),
(176, 'Nastro', 'nastro tape kipsta', 18, 204, -1),
(177, 'Ginocchiere pallavolo', 'ginocchiere errea tokyo', 18, 205, -1),
(178, 'Gomitiere pallavolo', 'gomitiere errea artio', 18, 206, -1),
(179, 'Protezione pali', 'protezione pali gomma gialla mikasa', 18, 207, -1),
(180, 'Scarpe pallavolo', 'scarpe mizuno wave hurricane 3 MID donna', 18, 208, -1),
(181, 'Cuffia nuoto', 'cuffia nuoto arena rosa', 19, 209, -1),
(182, 'Cuffia nuoto', 'cuffia nuoto speedo rosa', 19, 210, -1),
(183, 'Cuffia nuoto', 'cuffia nuoto speedo nera', 19, 211, -1),
(184, 'Cuffia nuoto', 'cuffia nuoto arena nera', 19, 212, -1),
(185, 'Occhialini piscina', 'occhialini piscina speedo neri', 19, 213, -1),
(186, 'Occhialini piscina', 'occhialini piscina arena trasparenti', 19, 214, -1),
(187, 'Maschera snorkeling', 'maschera snorkeling subea bianca/blu', 19, 215, -1),
(188, 'Pinne', 'pinne da immersione speedo rosso/nere', 19, 216, -1),
(189, 'Costume nuoto', 'costume arena carbon flex nero donna', 19, 217, -1),
(190, 'Costume nuoto', 'costume arena carbon flex nero uomo', 19, 218, -1),
(191, 'Stivale per motocross', 'stivale per motocross fox blu/arancio', 20, 219, -1),
(192, 'Stivale per motocross', 'stivale per motocross fox bianco/rosso', 20, 220, -1),
(193, 'Stivali per moto stradali', 'stivali per moto stradale alpinestars multicolor', 20, 221, -1),
(194, 'Stivali per moto stradali', 'stivali per moto stradale alpinestars bianco/rosso/neri', 20, 222, -1),
(195, 'Tuta per motocross ', 'tuta per motocross fox nero/gialla', 20, 223, -1),
(196, 'Tuta per motocross', 'tuta per motocross fox multicolor', 20, 224, -1),
(197, 'Sedili corsa', 'sedili corsa sparco nero', 20, 225, -1),
(198, 'Cintura corsa', 'cintura corsa sparco 4 punti blu', 20, 226, -1),
(199, 'Cintura corsa', 'cintura corsa sparco 4 punti nera', 20, 227, -1),
(200, 'Macchina da corsa', 'macchina da formula 1 ferrari SF71H', 20, 228, -1),
(201, 'Fiocine', 'fiocina subacquea beuchat nera', 21, 229, -1),
(202, 'Parapendii', 'vela parapendio Icaro Cyber TE DHV1 EN-A misura S ', 21, 230, -1),
(203, 'Tuta astronauta', 'tuta astronauta nasa bianca', 21, 231, -1),
(204, 'Corde bungee jumping', 'corda ricambio bungee jumping 15mt', 21, 232, -1),
(205, 'Piccozze alta montagna', 'piccozze ghiaccio grrivel giallo/nere', 21, 233, -1),
(206, 'Ramponi ghiaccio', 'ramponi ghiaccio grivel g12', 21, 234, -1),
(207, 'Ossigeno monouso', 'ossigeno monouso per alta montagna', 21, 235, -1),
(208, 'Corda da slackline', 'ricambio corda da slackline rossa', 21, 236, -1),
(209, 'Bici downhill', 'bici downhill scott bianca/blu', 21, 237, -1),
(210, 'RedBull energy drink', 'main sponsor per gli sport estremi', 21, 238, -1),
(211, 'prova prodotto', 'prodotto multi imm', 2, 240, -1),
(212, 'Integratori', 'integratori di sali minerali', 21, 242, 17);

-- --------------------------------------------------------

--
-- Struttura della tabella `scadenza`
--

CREATE TABLE `scadenza` (
  `Prodotto_idProdotto` int(11) NOT NULL,
  `ListaSpesa_idListaSpesa` int(11) NOT NULL,
  `media` int(11) DEFAULT NULL,
  `contatore` int(11) DEFAULT NULL,
  `primo` time DEFAULT NULL,
  `ultimo` time DEFAULT NULL,
  `visto` tinyint(1) DEFAULT '0',
  `contEmail` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `scadenza`
--

INSERT INTO `scadenza` (`Prodotto_idProdotto`, `ListaSpesa_idListaSpesa`, `media`, `contatore`, `primo`, `ultimo`, `visto`, `contEmail`) VALUES
(26, 19, 984, 5, '18:29:33', '18:29:33', 0, 0),
(31, 12, 782, 8, '18:08:43', '18:08:43', 0, 0),
(33, 12, 754, 2, '18:08:45', '18:08:45', 0, 0),
(37, 12, 142, 3, '18:08:44', '18:08:59', 1, 0),
(41, 12, 135, 1, '18:08:41', '18:08:41', 0, 0),
(43, 19, 147, 1, '18:29:31', '18:29:31', 0, 0),
(45, 18, 135, 4, '18:27:27', '18:27:27', 0, 0),
(46, 14, 254, 46, '18:12:53', '18:12:53', 0, 0),
(46, 16, 258, 122, '18:20:27', '18:20:27', 0, 0),
(47, 12, 369, 2, '18:08:47', '18:08:47', 0, 0),
(48, 18, 333, 5, '18:27:23', '18:27:23', 0, 0),
(53, 21, 124, 7, '18:33:24', '18:33:24', 0, 0),
(73, 20, 240, 9, '18:31:36', '18:31:36', 0, 0),
(74, 20, 120, 8, '18:31:32', '18:31:32', 0, 0),
(97, 14, 324, 7, '18:12:50', '18:12:50', 0, 0),
(116, 13, 248, 9, '18:14:01', '18:14:01', 0, 0),
(128, 15, 985, 32, '18:18:24', '18:18:24', 0, 0),
(142, 21, 167, 44, '18:33:29', '18:33:29', 0, 0),
(156, 21, 201, 12, '18:33:27', '18:33:27', 0, 0),
(167, 17, 347, 5, '18:24:53', '18:24:53', 0, 0),
(177, 16, 400, 4, '18:20:17', '18:20:17', 0, 0),
(201, 14, 169, 56, '18:12:41', '18:12:41', 0, 0),
(204, 15, 187, 2, '18:18:23', '18:18:23', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `types`
--

CREATE TABLE `types` (
  `idTypes` int(11) NOT NULL,
  `nomeIng` varchar(144) NOT NULL,
  `nomeIt` varchar(144) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `types`
--

INSERT INTO `types` (`idTypes`, `nomeIng`, `nomeIt`) VALUES
(1, 'art_gallery', 'galleria d arte'),
(2, 'bakery', 'panificio'),
(3, 'bar', 'bar'),
(4, 'bicycle_store', 'negozio di biciclette'),
(5, 'book_store', 'libreria'),
(6, 'cafe', 'bar'),
(7, 'car_dealer', 'concessionario'),
(8, 'clothing_store', 'negozio di abbigliamento'),
(9, 'convenience_store', 'minimarket'),
(10, 'department_store', 'grande_magazzino'),
(11, 'electronics_store', 'negozio di elettronica'),
(12, 'florist', 'fioraio'),
(13, 'furniture_store', 'mobilificio'),
(14, 'hardware_store', '	ferramenta'),
(15, 'jewelry_store', 'gioielleria'),
(16, 'liquor_store', 'negozi di liquori'),
(17, 'movie_rental', 'videoteca'),
(18, 'pet_store', 'negozio di animali'),
(19, 'pharmacy', 'farmacia'),
(20, 'shoe_store', 'negozio di scarpe'),
(21, 'shopping_mall', 'centro commerciale'),
(22, 'store', 'negozio'),
(23, 'supermarket', 'supermercato/alimentari');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `idUtente` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `email` varchar(140) NOT NULL,
  `password` varchar(140) NOT NULL,
  `Immagini_idImmagini` int(11) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  `identificativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`idUtente`, `Nome`, `Cognome`, `email`, `password`, `Immagini_idImmagini`, `admin`, `checked`, `identificativo`) VALUES
(19, 'Safouane', 'Fatnassi', 'safu9696@gmail.com', 'T2N0b3B1c3N5MVw/', 1, 0, 1, 418711187),
(20, 'Mario', 'Rossi', 'safu96@live.it', 'T2N0b3B1c3N5MVw/', 1, 0, 1, 385833836),
(21, 'Bruno', 'Orso', 'safouane.fatnassi@studenti.unitn.it', 'T2N0b3B1c3N5MVw/', 1, 1, 1, 186013516),
(22, 'Fabio', 'Zanardello', 'fabiozanardello@live.it', 'T2N0b3B1c3N5MVw/', 1, 0, 1, 115460924),
(23, 'Mario', 'Bassan', 'zanardellofabio@gmail.com', 'T2N0b3B1c3N5MVw/', 1, 1, 1, 256659236),
(24, 'Emanuele', 'Deanesi', 'emanuele.deanesi@gmail.com', 'T2N0b3B1c3N5MVw/', 1, 0, 1, 81888504),
(25, 'Pippo', 'Baudo', 'emanuele.deanesi@studenti.unitn.it', 'T2N0b3B1c3N5MVw/', 1, 0, 1, 418806128),
(26, 'Matteo', 'Piovesan', 'matteo.piovesan-1@studenti.unitn.it', 'T2N0b3B1c3N5MVw/', 1, 0, 1, 355346024),
(27, 'Enrico', 'Melchiori', 'enrico.melchiori@libero.it', 'T2N0b3B1c3N5MVw/', 1, 0, 1, 136133611),
(28, 'Gianni', 'Verdi', 'enrico.melchiori@studenti.unitn.it', 'T2N0b3B1c3N5MVw/', 1, 0, 1, 35831537);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente_has_listaspesa`
--

CREATE TABLE `utente_has_listaspesa` (
  `Utente_idUtente` int(11) NOT NULL,
  `ListaSpesa_idListaSpesa` int(11) NOT NULL,
  `proprietario` tinyint(1) DEFAULT NULL,
  `modCat` tinyint(1) DEFAULT NULL,
  `aggProd` tinyint(1) DEFAULT NULL,
  `elProd` tinyint(1) DEFAULT NULL,
  `elLista` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utente_has_listaspesa`
--

INSERT INTO `utente_has_listaspesa` (`Utente_idUtente`, `ListaSpesa_idListaSpesa`, `proprietario`, `modCat`, `aggProd`, `elProd`, `elLista`) VALUES
(19, 12, 1, 1, 1, 1, 1),
(19, 13, 1, 1, 1, 1, 1),
(19, 14, 1, 1, 1, 1, 1),
(20, 14, 0, 1, 1, 1, 1),
(20, 15, 1, 1, 1, 1, 1),
(21, 14, 0, 1, 0, 1, 0),
(21, 15, 0, 0, 1, 1, 0),
(22, 14, 0, 1, 0, 0, 1),
(22, 16, 1, 1, 1, 1, 1),
(24, 14, 0, 1, 1, 1, 0),
(24, 17, 1, 1, 1, 1, 1),
(25, 14, 0, 1, 0, 1, 1),
(25, 18, 1, 1, 1, 1, 1),
(26, 14, 0, 0, 0, 0, 0),
(26, 19, 1, 1, 1, 1, 1),
(27, 14, 0, 1, 1, 1, 1),
(27, 20, 1, 1, 1, 1, 1),
(28, 14, 0, 0, 1, 1, 0),
(28, 21, 1, 1, 1, 1, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `accessochat`
--
ALTER TABLE `accessochat`
  ADD KEY `ListaSpesa_idListaSpesa` (`ListaSpesa_idListaSpesa`),
  ADD KEY `Utente_idUtente` (`Utente_idUtente`);

--
-- Indici per le tabelle `categorialista`
--
ALTER TABLE `categorialista`
  ADD PRIMARY KEY (`idCategoriaLista`),
  ADD UNIQUE KEY `Nome_2` (`Nome`),
  ADD KEY `Nome` (`idTypes`);

--
-- Indici per le tabelle `categoriaprodotto`
--
ALTER TABLE `categoriaprodotto`
  ADD PRIMARY KEY (`idCategoriaProdotto`),
  ADD UNIQUE KEY `Nome` (`Nome`),
  ADD KEY `fk_CategoriaProdotto_Logo1_idx` (`Logo_idLogo`);

--
-- Indici per le tabelle `immagine`
--
ALTER TABLE `immagine`
  ADD PRIMARY KEY (`idImmagini`),
  ADD UNIQUE KEY `Indirizzo_UNIQUE` (`Indirizzo`),
  ADD KEY `Prodotto_idProdotto` (`Prodotto_idProdotto`),
  ADD KEY `CategoriaLista_idCategoriaLista` (`CategoriaLista_idCategoriaLista`);

--
-- Indici per le tabelle `listaspesa`
--
ALTER TABLE `listaspesa`
  ADD PRIMARY KEY (`idListaSpesa`),
  ADD KEY `fk_ListaSpesa_CategoriaLista_idx` (`CategoriaLista_idCategoriaLista`),
  ADD KEY `Immagini_idImmagini` (`Immagini_idImmagini`);

--
-- Indici per le tabelle `listaspesa_has_prodotto`
--
ALTER TABLE `listaspesa_has_prodotto`
  ADD PRIMARY KEY (`ListaSpesa_idListaSpesa`,`Prodotto_idProdotto`),
  ADD KEY `fk_ListaSpesa_has_Prodotto_Prodotto1_idx` (`Prodotto_idProdotto`),
  ADD KEY `fk_ListaSpesa_has_Prodotto_ListaSpesa1_idx` (`ListaSpesa_idListaSpesa`);

--
-- Indici per le tabelle `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`idLogo`),
  ADD UNIQUE KEY `Indirizzo_UNIQUE` (`Indirizzo`);

--
-- Indici per le tabelle `messaggio`
--
ALTER TABLE `messaggio`
  ADD PRIMARY KEY (`idMessaggio`),
  ADD KEY `Utente_idUtente` (`Utente_idUtente`,`ListaSpesa_idListaSpesa`);

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`idProdotto`),
  ADD UNIQUE KEY `Logo_idLogo` (`Logo_idLogo`),
  ADD KEY `fk_Prodotto_CategoriaProdotto1_idx` (`CategoriaProdotto_idCategoriaProdotto`),
  ADD KEY `fk_Prodotto_Logo1_idx` (`Logo_idLogo`);

--
-- Indici per le tabelle `scadenza`
--
ALTER TABLE `scadenza`
  ADD PRIMARY KEY (`Prodotto_idProdotto`,`ListaSpesa_idListaSpesa`),
  ADD KEY `ListaSpesa_idListaSpesa` (`ListaSpesa_idListaSpesa`);

--
-- Indici per le tabelle `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`idTypes`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`idUtente`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_Utente_Immagini1_idx` (`Immagini_idImmagini`);

--
-- Indici per le tabelle `utente_has_listaspesa`
--
ALTER TABLE `utente_has_listaspesa`
  ADD PRIMARY KEY (`Utente_idUtente`,`ListaSpesa_idListaSpesa`),
  ADD KEY `fk_Utente_has_ListaSpesa_ListaSpesa1_idx` (`ListaSpesa_idListaSpesa`),
  ADD KEY `fk_Utente_has_ListaSpesa_Utente1_idx` (`Utente_idUtente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `categorialista`
--
ALTER TABLE `categorialista`
  MODIFY `idCategoriaLista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT per la tabella `categoriaprodotto`
--
ALTER TABLE `categoriaprodotto`
  MODIFY `idCategoriaProdotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT per la tabella `immagine`
--
ALTER TABLE `immagine`
  MODIFY `idImmagini` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;
--
-- AUTO_INCREMENT per la tabella `listaspesa`
--
ALTER TABLE `listaspesa`
  MODIFY `idListaSpesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT per la tabella `logo`
--
ALTER TABLE `logo`
  MODIFY `idLogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;
--
-- AUTO_INCREMENT per la tabella `messaggio`
--
ALTER TABLE `messaggio`
  MODIFY `idMessaggio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `idProdotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT per la tabella `types`
--
ALTER TABLE `types`
  MODIFY `idTypes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `accessochat`
--
ALTER TABLE `accessochat`
  ADD CONSTRAINT `accessochat_ibfk_1` FOREIGN KEY (`ListaSpesa_idListaSpesa`) REFERENCES `listaspesa` (`idListaSpesa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accessochat_ibfk_2` FOREIGN KEY (`Utente_idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `categorialista`
--
ALTER TABLE `categorialista`
  ADD CONSTRAINT `categorialista_ibfk_1` FOREIGN KEY (`idTypes`) REFERENCES `types` (`idTypes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `categoriaprodotto`
--
ALTER TABLE `categoriaprodotto`
  ADD CONSTRAINT `fk_CategoriaProdotto_Logo1` FOREIGN KEY (`Logo_idLogo`) REFERENCES `logo` (`idLogo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `immagine`
--
ALTER TABLE `immagine`
  ADD CONSTRAINT `immagine_ibfk_1` FOREIGN KEY (`Prodotto_idProdotto`) REFERENCES `prodotto` (`idProdotto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `immagine_ibfk_2` FOREIGN KEY (`CategoriaLista_idCategoriaLista`) REFERENCES `categorialista` (`idCategoriaLista`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `listaspesa`
--
ALTER TABLE `listaspesa`
  ADD CONSTRAINT `Immagini_idImmagini` FOREIGN KEY (`Immagini_idImmagini`) REFERENCES `immagine` (`idImmagini`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ListaSpesa_CategoriaLista` FOREIGN KEY (`CategoriaLista_idCategoriaLista`) REFERENCES `categorialista` (`idCategoriaLista`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `listaspesa_has_prodotto`
--
ALTER TABLE `listaspesa_has_prodotto`
  ADD CONSTRAINT `fk_ListaSpesa_has_Prodotto_ListaSpesa1` FOREIGN KEY (`ListaSpesa_idListaSpesa`) REFERENCES `listaspesa` (`idListaSpesa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ListaSpesa_has_Prodotto_Prodotto1` FOREIGN KEY (`Prodotto_idProdotto`) REFERENCES `prodotto` (`idProdotto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `messaggio`
--
ALTER TABLE `messaggio`
  ADD CONSTRAINT `messaggio_ibfk_1` FOREIGN KEY (`Utente_idUtente`,`ListaSpesa_idListaSpesa`) REFERENCES `utente_has_listaspesa` (`Utente_idUtente`, `ListaSpesa_idListaSpesa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  ADD CONSTRAINT `fk_Prodotto_CategoriaProdotto1` FOREIGN KEY (`CategoriaProdotto_idCategoriaProdotto`) REFERENCES `categoriaprodotto` (`idCategoriaProdotto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Prodotto_Logo1` FOREIGN KEY (`Logo_idLogo`) REFERENCES `logo` (`idLogo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `scadenza`
--
ALTER TABLE `scadenza`
  ADD CONSTRAINT `scadenza_ibfk_1` FOREIGN KEY (`Prodotto_idProdotto`) REFERENCES `prodotto` (`idProdotto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scadenza_ibfk_2` FOREIGN KEY (`ListaSpesa_idListaSpesa`) REFERENCES `listaspesa` (`idListaSpesa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scadenza_ibfk_3` FOREIGN KEY (`Prodotto_idProdotto`) REFERENCES `prodotto` (`idProdotto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `utente`
--
ALTER TABLE `utente`
  ADD CONSTRAINT `fk_Utente_Immagini1` FOREIGN KEY (`Immagini_idImmagini`) REFERENCES `immagine` (`idImmagini`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `utente_has_listaspesa`
--
ALTER TABLE `utente_has_listaspesa`
  ADD CONSTRAINT `fk_Utente_has_ListaSpesa_ListaSpesa1` FOREIGN KEY (`ListaSpesa_idListaSpesa`) REFERENCES `listaspesa` (`idListaSpesa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Utente_has_ListaSpesa_Utente1` FOREIGN KEY (`Utente_idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
