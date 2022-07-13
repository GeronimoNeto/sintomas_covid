-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Jul-2022 às 00:31
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `covid`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `id` int(11) NOT NULL,
  `sintomas` int(11) NOT NULL,
  `lista` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resultado` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `_token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `atendimentos`
--

INSERT INTO `atendimentos` (`id`, `sintomas`, `lista`, `resultado`, `created_at`, `updated_at`, `idPaciente`, `_token`) VALUES
(12, 7, 'Mal estar geral,Dificuldade de locomoção,Falta de paladar,Dificuldade de respirar,Dores no corpo,Dor de cabeça,Coriza,', 1, '2022-07-13 02:31:18', '2022-07-13 04:59:06', 11, '6WLAY74Fzshp7OIjjarpBM7See6mw7MrlmC59X69'),
(13, 6, 'Dor de garganta,Mal estar geral,Dores no corpo,Cansaço,Coriza,Falta de olfato,', 1, '2022-07-13 03:23:04', '2022-07-13 03:23:04', 12, NULL),
(14, 2, 'Falta de paladar,Dificuldade de respirar,', 2, '2022-07-13 04:33:19', '2022-07-13 04:33:23', 15, '6WLAY74Fzshp7OIjjarpBM7See6mw7MrlmC59X69'),
(15, 2, 'Falta de paladar,Dor de cabeça,', 2, '2022-07-13 04:34:22', '2022-07-13 04:34:25', 17, '6WLAY74Fzshp7OIjjarpBM7See6mw7MrlmC59X69'),
(16, 2, 'Dificuldade de respirar,Tosse,', 2, '2022-07-13 04:37:27', '2022-07-13 04:37:31', 21, '6WLAY74Fzshp7OIjjarpBM7See6mw7MrlmC59X69'),
(17, 2, 'Mal estar geral,Dores no corpo,', 2, '2022-07-13 04:38:40', '2022-07-13 04:38:42', 19, '6WLAY74Fzshp7OIjjarpBM7See6mw7MrlmC59X69'),
(18, 2, 'Dor de garganta,Mal estar geral,', 2, '2022-07-13 04:41:48', '2022-07-13 04:41:49', 18, '6WLAY74Fzshp7OIjjarpBM7See6mw7MrlmC59X69'),
(19, 2, 'Dificuldade de respirar,Dor de cabeça,', 2, '2022-07-13 04:42:49', '2022-07-13 04:52:53', 14, '6WLAY74Fzshp7OIjjarpBM7See6mw7MrlmC59X69'),
(20, 6, 'Dores no corpo,Tosse,Nariz entupido,Coriza,Dificuldade de respirar,Dor de garganta,', 1, '2022-07-13 04:54:21', '2022-07-13 04:54:21', 20, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nasc` date NOT NULL,
  `cpf` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wpp` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(17) COLLATE utf8mb4_unicode_ci DEFAULT 'none.jpg',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` tinyint(4) NOT NULL,
  `_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome`, `nasc`, `cpf`, `wpp`, `foto`, `created_at`, `updated_at`, `estado`, `_token`) VALUES
(7, 'Cafuné de Goiaba', '1988-04-23', '99999999999', '99999999999', 'none.jpg', '2022-06-30 18:43:10', '2022-06-30 18:43:10', 0, NULL),
(11, 'Carlos Eduardo', '1980-04-23', '98884848384', '48384893483', 'none.jpg', '2022-06-30 19:17:16', '2022-07-13 22:31:17', 1, NULL),
(12, 'Batman Rapido', '2010-10-29', '92349293492', '23849234923', '62be04774a20c.jpg', '2022-06-30 20:15:51', '2022-06-30 20:15:51', 3, NULL),
(13, 'Eren Nordestino', '1940-08-18', '93249239432', '95492345934', 'none.jpg', '2022-06-30 20:16:26', '2022-06-30 20:16:26', 3, NULL),
(14, 'nome sobre', '1900-10-10', '93492349324', '93402304239', '62be0548b6f1a.jpg', '2022-06-30 20:19:20', '2022-07-13 04:52:53', 2, NULL),
(15, 'Alves Dias', '2000-02-20', '39429349324', '93249324092', '62be07bf5142a.jpg', '2022-06-30 20:29:51', '2022-06-30 20:29:51', 0, NULL),
(17, 'Camila Salgado', '1980-10-10', '93949324923', '34239423894', '62be08f8a22ad.jpg', '2022-06-30 20:35:04', '2022-06-30 20:35:04', 0, NULL),
(19, 'Victor Hugo', '2009-09-09', '94230949234', '39409239423', '62be09bcae2bf.png', '2022-06-30 20:38:20', '2022-06-30 20:38:20', 0, NULL),
(20, 'Charles Oliveira', '2012-12-28', '39423402390', '39203402390', 'none.jpg', '2022-06-30 20:39:23', '2022-07-13 04:54:21', 1, NULL),
(21, 'Paciente Doente', '1999-08-23', '23949239410', '29239239293', 'none.jpg', '2022-07-04 21:11:29', '2022-07-04 21:11:29', 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
