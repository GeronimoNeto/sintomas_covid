-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Jun-2022 às 22:52
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
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome`, `nasc`, `cpf`, `wpp`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'José da Silva', '1980-06-07', '12345678910', '85991445755', 'none.jpg', '2022-06-30 15:00:43', '2022-06-30 15:00:58'),
(2, 'Carlos Magnus', '1870-06-15', '00000000020', '85992446788', 'none.jpg', '2022-06-30 15:00:43', '2022-06-30 15:00:58'),
(3, 'Maria Antonieta Sales', '2003-09-29', '10020030050', '11952278940', 'none.jpg', '2022-06-30 15:00:43', '2022-06-30 15:00:58'),
(4, 'Edinaldo Pereira', '1920-10-10', '50077788899', '11924024029', 'none.jpg', '2022-06-30 18:17:58', '2022-06-30 18:17:58'),
(5, 'Gabriel Lima', '2000-09-09', '93294239493', '92348239429', 'none.jpg', '2022-06-30 18:38:45', '2022-06-30 18:38:45'),
(6, 'Coliseu Dias', '2000-10-10', '34234234234', '93294923482', 'none.jpg', '2022-06-30 18:41:54', '2022-06-30 18:41:54'),
(7, 'Cafuné de Goiaba', '1988-04-23', '99999999999', '99999999999', 'none.jpg', '2022-06-30 18:43:10', '2022-06-30 18:43:10'),
(8, 'Codorna Doce', '2012-12-12', '22222222222', '22222222222', 'none.jpg', '2022-06-30 18:44:09', '2022-06-30 18:44:09'),
(9, 'Raimundo Barba', '1975-10-10', '92934923848', '48953899490', 'none.jpg', '2022-06-30 19:08:06', '2022-06-30 19:08:06'),
(10, 'Thiago Neves', '1978-05-08', '29834823848', '93582348529', 'none.jpg', '2022-06-30 19:09:13', '2022-06-30 19:09:13'),
(11, 'Carlos Doido', '2003-04-23', '98884848384', '48384893483', 'none.jpg', '2022-06-30 19:17:16', '2022-06-30 19:17:16'),
(12, 'Batman Rapido', '2010-10-29', '92349293492', '23849234923', '62be04774a20c.jpg', '2022-06-30 20:15:51', '2022-06-30 20:15:51'),
(13, 'Eren Nordestino', '1940-08-18', '93249239432', '95492345934', 'none.jpg', '2022-06-30 20:16:26', '2022-06-30 20:16:26'),
(14, 'nome sobre', '1900-10-10', '93492349324', '93402304239', '62be0548b6f1a.jpg', '2022-06-30 20:19:20', '2022-06-30 20:19:20'),
(15, 'Alves Dias', '2000-02-20', '39429349324', '93249324092', '62be07bf5142a.jpg', '2022-06-30 20:29:51', '2022-06-30 20:29:51'),
(16, 'Luffy Borracha', '2000-10-10', '29103203120', '93240234923', 'none.jpg', '2022-06-30 20:30:32', '2022-06-30 20:30:32'),
(17, 'Camila Salgado', '1980-10-10', '93949324923', '34239423894', '62be08f8a22ad.jpg', '2022-06-30 20:35:04', '2022-06-30 20:35:04'),
(18, 'Almeida Silva', '1901-12-02', '94239492349', '32492394239', 'none.jpg', '2022-06-30 20:35:35', '2022-06-30 20:35:35'),
(19, 'Victor Hugo', '2009-09-09', '94230949234', '39409239423', '62be09bcae2bf.png', '2022-06-30 20:38:20', '2022-06-30 20:38:20'),
(20, 'Charles Oliveira', '2012-12-28', '39423402390', '39203402390', 'none.jpg', '2022-06-30 20:39:23', '2022-06-30 20:39:23');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
