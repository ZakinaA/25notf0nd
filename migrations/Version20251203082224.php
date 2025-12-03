<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20251203082224 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE professeur ADD role_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE professeur ADD CONSTRAINT FK_17A55299D60322AC FOREIGN KEY (role_id) REFERENCES role (id)');
        $this->addSql('CREATE INDEX IDX_17A55299D60322AC ON professeur (role_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE professeur DROP FOREIGN KEY FK_17A55299D60322AC');
        $this->addSql('DROP INDEX IDX_17A55299D60322AC ON professeur');
        $this->addSql('ALTER TABLE professeur DROP role_id');
    }
}
