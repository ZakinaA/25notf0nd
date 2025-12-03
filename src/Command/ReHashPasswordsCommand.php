<?php

namespace App\Command;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

#[AsCommand(
    name: 'app:rehash-passwords',
    description: 'Rehash all user passwords based on their email username.',
)]
class ReHashPasswordsCommand extends Command
{
    public function __construct(
        private EntityManagerInterface $em,
        private UserPasswordHasherInterface $passwordHasher
    ) {
        parent::__construct();
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $users = $this->em->getRepository(User::class)->findAll();

        foreach ($users as $user) {
            $email = $user->getEmail();

            if (!$email || !str_contains($email, '@')) {
                continue; // ignore les emails invalides
            }

            // partie avant le @
            $plainPassword = strstr($email, '@', true);

            // hash Symfony (bcrypt/argon2 selon config)
            $hashedPassword = $this->passwordHasher->hashPassword($user, $plainPassword);

            $user->setPassword($hashedPassword);

            $output->writeln("✔ Mot de passe mis à jour pour : $email");
        }

        $this->em->flush();

        $output->writeln("🎉 Tous les mots de passe ont été régénérés avec succès.");

        return Command::SUCCESS;
    }
}
